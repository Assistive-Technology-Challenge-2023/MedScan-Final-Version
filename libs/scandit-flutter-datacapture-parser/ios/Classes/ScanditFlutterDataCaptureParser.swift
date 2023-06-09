/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Flutter
import scandit_flutter_datacapture_core
import ScanditParser
import UIKit

enum FunctionName {
    static let parseString = "parseString"
    static let parseRawData = "parseRawData"
}

enum ScanditDataCaptureParserError: Int, CustomNSError {
    case componentNotFound = 1
    case invalidBase64Data = 2

    var errorCode: Int {
        rawValue
    }

    static var errorDomain: String {
        "ScanditDataCaptureParserDomain"
    }

    var message: String {
        switch self {
        case .componentNotFound:
            return "Component not found for the specified id."
        case .invalidBase64Data:
            return "Rawdata is not a valid base64 data."
        }
    }

    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: message]
    }
}

fileprivate extension FlutterError {
    static func create(_ error: ScanditDataCaptureParserError) -> FlutterError {
        return create(error: error as NSError)
    }

    static func create(error: NSError) -> FlutterError {
        return FlutterError(code: error.domain,
                            message: error.localizedDescription,
                            details: error.userInfo)
    }

    static var componentNotFound = create(.componentNotFound)
    static var invalidBase64Data = create(.invalidBase64Data)
}

@objc
public class ScanditFlutterDataCaptureParser: NSObject {

    private let methodChannel: FlutterMethodChannel

    internal var parsers: [String: Parser] = [:]

    private func parser(with id: String) -> Parser? {
        defer {
            let toBeRemoved = parsers.keys.filter { ScanditFlutterDataCaptureCore.hasComponent(with: $0) == false }
            toBeRemoved.forEach { parsers.removeValue(forKey: $0) }
        }
        return parsers[id]
    }

    @objc
    public init(methodChannel: FlutterMethodChannel) {
        self.methodChannel = methodChannel
        super.init()
        registerDeserializer()
    }

    @objc
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as! [String: Any]
        switch call.method {
        case FunctionName.parseString:
            parseString(args, result: result)
        case FunctionName.parseRawData:
            parseRawData(args, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    @objc
    public func dispose() {
        methodChannel.setMethodCallHandler(nil)
        parsers.removeAll()
    }

    private func parseString(_ arguments: [String: Any], result: @escaping FlutterResult) {
        guard let id = arguments["parserId"] as? String,
              let data = arguments["data"] as? String,
              let parser = parser(with: id) else {
                  result(FlutterError.componentNotFound)
            return
        }
        do {
            let parserResult = try parser.parseString(data)
            result(parserResult.jsonString)
        } catch {
            result(FlutterError.create(error: error as NSError))
        }
    }

    private func parseRawData(_ arguments: [String: Any], result: @escaping FlutterResult) {
        guard let id = arguments["parserId"] as? String,
              let stringData = arguments["data"] as? String,
              let parser = parser(with: id) else {
            result(FlutterError.componentNotFound)
            return
        }
        guard let data = Data(base64Encoded: stringData) else {
            result(FlutterError.invalidBase64Data)
            return
        }
        do {
            let parserResult = try parser.parseRawData(data)
            result(parserResult.jsonString)
        } catch {
            result(FlutterError.create(error: error as NSError))
        }
    }
}
