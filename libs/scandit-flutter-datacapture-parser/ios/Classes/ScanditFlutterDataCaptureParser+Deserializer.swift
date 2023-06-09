/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Foundation
import scandit_flutter_datacapture_core
import ScanditParser

extension ScanditFlutterDataCaptureParser {
    func registerDeserializer() {
        let parserDeserializer = ParserDeserializer()
        parserDeserializer.delegate = self
        ScanditFlutterDataCaptureCore.register(componentDeserializer: parserDeserializer)
    }
}

extension ScanditFlutterDataCaptureParser: ParserDeserializerDelegate {
    public func parserDeserializer(_ parserDeserializer: ParserDeserializer,
                                   didStartDeserializingParser parser: Parser,
                                   from jsonValue: JSONValue) {
        // not used in frameworks
    }

    public func parserDeserializer(_ parserDeserializer: ParserDeserializer,
                                   didFinishDeserializingParser parser: Parser,
                                   from jsonValue: JSONValue) {
        parsers[parser.componentId] = parser
    }
}
