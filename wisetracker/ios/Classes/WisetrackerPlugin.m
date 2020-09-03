#import "WisetrackerPlugin.h"
#import <WiseTracker/WiseTracker.h>

@implementation WisetrackerPlugin


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"wisetracker"
            binaryMessenger:[registrar messenger]];
  WisetrackerPlugin* instance = [[WisetrackerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
      NSLog(@"getPlatformVersion");
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"init" isEqualToString:call.method]) {
      NSString *appKey = call.arguments[@"appKey"];
      [WiseTracker applicationKey:appKey];
      [WiseTracker setApplication:UIApplication.sharedApplication];
      [WiseTracker initEnd];
      [WiseTracker startPage:@"MAIN"];
  } else if ([@"startPage" isEqualToString:call.method]) {
      NSString *pageId = call.arguments[@"pageId"];
      [WiseTracker startPage:pageId];
  } else if ([@"" isEqualToString:call.method]) {
      NSString *pageId = call.arguments[@"pageId"];
      [WiseTracker endPage:pageId];
  } else if ([@"" isEqualToString:call.method]) {
      NSString *pnc = call.arguments[@"pnc"];
      [WiseTracker setGoalProduct:pnc];
  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"" isEqualToString:call.method]) {

  } else if ([@"sendTransaction" isEqualToString:call.method]) {
      [WiseTracker sendTransaction];
  } else if ([@"setProduct" isEqualToString:call.method]) {
      NSString *productCode = call.arguments[@"productCode"];
      NSString *productName = call.arguments[@"productName"];

      [WiseTracker setProduct:productCode name:productName];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
