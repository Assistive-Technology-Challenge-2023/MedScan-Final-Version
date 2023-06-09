/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

#import "ScanditFlutterDataCaptureParserPlugin.h"

#import <scandit_flutter_datacapture_parser/scandit_flutter_datacapture_parser-Swift.h>

@interface ScanditFlutterDataCaptureParserPlugin ()

@property (nonatomic, strong) ScanditFlutterDataCaptureParser *parserInstance;

- (instancetype)initWithParserInstance:(ScanditFlutterDataCaptureParser *)parserInstance;

@end

@implementation ScanditFlutterDataCaptureParserPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
        methodChannelWithName:@"com.scandit.datacapture.parser.method/parser"
              binaryMessenger:registrar.messenger];
    ScanditFlutterDataCaptureParser *parser = [[ScanditFlutterDataCaptureParser alloc]
        initWithMethodChannel:channel];
    ScanditFlutterDataCaptureParserPlugin *parserPlugin =
        [[ScanditFlutterDataCaptureParserPlugin alloc] initWithParserInstance:parser];
    [registrar addMethodCallDelegate:parserPlugin channel:channel];
}

- (instancetype)initWithParserInstance:(ScanditFlutterDataCaptureParser *)parserInstance {
    if (self = [super init]) {
        _parserInstance = parserInstance;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    [self.parserInstance handle:call result:result];
}

- (void)detachFromEngineForRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [self.parserInstance dispose];
}

@end
