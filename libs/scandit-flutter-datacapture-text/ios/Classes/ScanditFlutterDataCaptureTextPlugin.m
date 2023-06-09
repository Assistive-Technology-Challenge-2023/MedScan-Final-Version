/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

#import "ScanditFlutterDataCaptureTextPlugin.h"

#import <scandit_flutter_datacapture_text/scandit_flutter_datacapture_text-Swift.h>

@interface ScanditFlutterDataCaptureTextPlugin ()

@property (class, nonatomic, strong) ScanditFlutterDataCaptureTextPlugin *instance;

@property (nonatomic, strong) ScanditFlutterDataCaptureText *textInstance;

@end

@implementation ScanditFlutterDataCaptureTextPlugin

static ScanditFlutterDataCaptureTextPlugin *_instance;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    ScanditFlutterDataCaptureText *textInstance = [[ScanditFlutterDataCaptureText alloc]
        initWith:registrar.messenger];
    ScanditFlutterDataCaptureTextPlugin *textPlugin = [[ScanditFlutterDataCaptureTextPlugin alloc]
        initWithTextInstance:textInstance];
    [ScanditFlutterDataCaptureTextPlugin setInstance:textPlugin];
}

+ (ScanditFlutterDataCaptureTextPlugin *)instance {
    return _instance;
}

+ (void)setInstance:(ScanditFlutterDataCaptureTextPlugin *)instance {
    _instance = instance;
}

- (instancetype)initWithTextInstance:(ScanditFlutterDataCaptureText *)textInstance {
    if (self = [super init]) {
        _textInstance = textInstance;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    result(FlutterMethodNotImplemented);
}

- (void)detachFromEngineForRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [self.textInstance dispose];
    [ScanditFlutterDataCaptureTextPlugin setInstance:nil];
}
@end
