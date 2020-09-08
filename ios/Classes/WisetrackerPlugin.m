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

- (NSString*)getString:(FlutterMethodCall*)call param1:(NSString*)param1 {
    NSString *returnStr = call.arguments[param1];
    return returnStr;
}

- (NSNumber*)getNumber:(FlutterMethodCall*)call param1:(NSString*)param1 {
    NSNumber *returnNum = call.arguments[param1];
    return returnNum;
}

- (NSArray*)getList:(FlutterMethodCall*)call param1:(NSString*)param1 {
    NSArray *returnArray = [[NSArray alloc] init];
    returnArray = call.arguments[param1];
    return returnArray;
}

- (NSInteger)getInteger:(FlutterMethodCall*)call param1:(NSString*)param1 {
    NSInteger returnInt = (NSInteger) call.arguments[param1];
    return returnInt;
}

//- (double)getDouble:(FlutterMethodCall*)call param1:(NSString*)param1 {
//    double returnDouble = (double) call.arguments[param1];
//    return returnDouble;
//}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    bool doExecute = false;
    @try {
       if ([@"getPlatformVersion" isEqualToString:call.method]) {
          NSLog(@"getPlatformVersion");
          result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
       }else if ([@"testFunction" isEqualToString:call.method]) {
           NSLog(@"testFunction");
       }else if ([@"init" isEqualToString:call.method]) {
           [WiseTracker applicationKey:[self getString:call param1:@"appKey"]];
           [WiseTracker setApplication:UIApplication.sharedApplication];
           [WiseTracker initEnd];
           [WiseTracker startPage:@"MAIN"];
           doExecute = true;
       }else if ([@"sendTransaction" isEqualToString:call.method]) {
           [WiseTracker sendTransaction];
           doExecute = true;
       }else if ([@"sendGoalData" isEqualToString:call.method]) {
           [WiseTracker sendGoalData];
           doExecute = true;
       }else if ([@"startPage" isEqualToString:call.method]) {
           [WiseTracker startPage:[self getString:call param1:@"obj"]];
           doExecute = true;
       }else if ([@"endPage" isEqualToString:call.method]) {
           [WiseTracker endPage:[self getString:call param1:@"pageCode"]];
           doExecute = true;
       }else if ([@"containsGoalData" isEqualToString:call.method]) {
           [WiseTracker containsGoalData:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"putGoalData" isEqualToString:call.method]) {
           [WiseTracker putGoalData:[self getString:call param1:@"key"] value:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"putPageData" isEqualToString:call.method]) {
           [WiseTracker putPageData:[self getString:call param1:@"key"] value:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"getPageData" isEqualToString:call.method]) {
           [WiseTracker getPageData:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"containsRevenueData" isEqualToString:call.method]) {
           [WiseTracker containsRevenueData:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"containsPageData" isEqualToString:call.method]) {
           [WiseTracker containsPageData:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"putSessionData" isEqualToString:call.method]) {
           [WiseTracker putSessionData:[self getString:call param1:@"key"] value:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"putSessionReferrer" isEqualToString:call.method]) {
           [WiseTracker putSessionReferrer:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setAdChannel" isEqualToString:call.method]) {
           [WiseTracker setAdChannel:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setAdChannelPeriod" isEqualToString:call.method]) {
           [WiseTracker setAdChannel:[self getString:call param1:@"code"] period:[NSNumber numberWithInteger:[self getInteger:call param1:@"period"]]];
           doExecute = true;
       }else if ([@"setAdKeyword" isEqualToString:call.method]) {
           [WiseTracker setAdKeyword:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setAdKeywordPeriod" isEqualToString:call.method]) {
           [WiseTracker setAdKeyword:[self getString:call param1:@"code"] period:[NSNumber numberWithInteger:[self getInteger:call param1:@"period"]]  ];
           doExecute = true;
       }else if ([@"setAdType" isEqualToString:call.method]) {
           [WiseTracker setAdType:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setAdTypePeriod" isEqualToString:call.method]) {
           [WiseTracker setAdType:[self getString:call param1:@"code"] period:[NSNumber numberWithInteger:[self getInteger:call param1:@"period"]]  ];
           doExecute = true;
       }else if ([@"setGoal" isEqualToString:call.method]) {
           [WiseTracker setGoal:[self getString:call param1:@"key"] value:[NSNumber numberWithInteger:[self getInteger:call param1:@"value"]]  ];
           doExecute = true;
       }else if ([@"setGoalProduct" isEqualToString:call.method]) {
           [WiseTracker setGoalProduct:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setGoalPageIdentity" isEqualToString:call.method]) {
           [WiseTracker setGoalPageIdentity:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setGoalProductArray" isEqualToString:call.method]) {
           [WiseTracker setGoalProductArray:[self getList:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setGoalContents" isEqualToString:call.method]) {
           [WiseTracker setGoalContents:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setGoalContentsArray" isEqualToString:call.method]) {
           [WiseTracker setGoalContentsArray:[self getList:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setGoalProductType" isEqualToString:call.method]) {
           [WiseTracker setGoalProductType:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductType2" isEqualToString:call.method]) {
           [WiseTracker setGoalProductType2:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductType3" isEqualToString:call.method]) {
           [WiseTracker setGoalProductType3:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductType4" isEqualToString:call.method]) {
           [WiseTracker setGoalProductType4:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductType5" isEqualToString:call.method]) {
           [WiseTracker setGoalProductType5:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductTypeArray" isEqualToString:call.method]) {
           [WiseTracker setGoalProductTypeArray:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductTypeArray2" isEqualToString:call.method]) {
           [WiseTracker setGoalProductTypeArray2:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductTypeArray3" isEqualToString:call.method]) {
           [WiseTracker setGoalProductTypeArray3:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductTypeArray4" isEqualToString:call.method]) {
           [WiseTracker setGoalProductTypeArray4:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setGoalProductCategory" isEqualToString:call.method]) {
           [WiseTracker setGoalProductCategory:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setGoalProductCategoryArray" isEqualToString:call.method]) {
           [WiseTracker setGoalProductCategoryArray:[self getList:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setProduct" isEqualToString:call.method]) {
           [WiseTracker setProduct:[self getString:call param1:@"code"] name:[self getString:call param1:@"name"]];
           doExecute = true;
       }else if ([@"setProductType" isEqualToString:call.method]) {
           [WiseTracker setProductType:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setProductCategory" isEqualToString:call.method]) {
           [WiseTracker setProductCategory:[self getString:call param1:@"code"] name:[self getString:call param1:@"name"]];
           doExecute = true;
       }else if ([@"setOrderNPaymentId" isEqualToString:call.method]) {
           [WiseTracker setOrderNPaymentId:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setOrderProduct" isEqualToString:call.method]) {
           [WiseTracker setOrderProduct:[self getString:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setOrderProductArray" isEqualToString:call.method]) {
           [WiseTracker setOrderProductArray:[self getList:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setOrderContents" isEqualToString:call.method]) {
           [WiseTracker setOrderContents:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setOrderContentsArray" isEqualToString:call.method]) {
           [WiseTracker setOrderContentsArray:[self getList:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setOrderProductType" isEqualToString:call.method]) {
           [WiseTracker setOrderProductType:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductTypeArray" isEqualToString:call.method]) {
           [WiseTracker setOrderProductTypeArray:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductType2" isEqualToString:call.method]) {
           [WiseTracker setOrderProductType2:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductTypeArray2" isEqualToString:call.method]) {
           [WiseTracker setOrderProductTypeArray2:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductType3" isEqualToString:call.method]) {
           [WiseTracker setOrderProductType3:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductTypeArray3" isEqualToString:call.method]) {
           [WiseTracker setOrderProductTypeArray3:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductType4" isEqualToString:call.method]) {
           [WiseTracker setOrderProductType4:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductTypeArray4" isEqualToString:call.method]) {
           [WiseTracker setOrderProductTypeArray4:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductType5" isEqualToString:call.method]) {
           [WiseTracker setOrderProductType5:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductTypeArray5" isEqualToString:call.method]) {
           [WiseTracker setOrderProductTypeArray5:[self getList:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductCategory" isEqualToString:call.method]) {
           [WiseTracker setOrderProductCategory:[self getString:call param1:@"type"]];
           doExecute = true;
       }else if ([@"setOrderProductCategoryArray" isEqualToString:call.method]) {
           [WiseTracker setOrderProductCategoryArray:[self getList:call param1:@"code"]];
           doExecute = true;
       }else if ([@"setOrderNo" isEqualToString:call.method]) {
           [WiseTracker setOrderNo:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setOrderAmount" isEqualToString:call.method]) {
           [WiseTracker setOrderAmount:[self getNumber:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setOrderAmountArray" isEqualToString:call.method]) {
           [WiseTracker setOrderAmountArray:[self getList:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setOrderConversionData" isEqualToString:call.method]) {
           [WiseTracker setOrderConversionData:[self getNumber:call param1:@"value"] key:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"setOrderConversionDataArray" isEqualToString:call.method]) {
           [WiseTracker setOrderConversionDataArray:[self getList:call param1:@"value"] key:[self getString:call param1:@"key"]];
           doExecute = true;
       }else if ([@"setOrderQuantity" isEqualToString:call.method]) {
           [WiseTracker setOrderQuantity:[self getInteger:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setContents" isEqualToString:call.method]) {
           [WiseTracker setContents:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setPageIdentity" isEqualToString:call.method]) {
           [WiseTracker setPageIdentity:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setSearchKeyword" isEqualToString:call.method]) {
           [WiseTracker setSearchKeyword:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setSearchKeywordResult" isEqualToString:call.method]) {
           [WiseTracker setSearchKeywordResult:[self getInteger:call param1:@"value"]];
           doExecute = true;
       }else if ([@"setSearchKeywordCategory" isEqualToString:call.method]) {
           [WiseTracker setSearchKeywordCategory:[self getString:call param1:@"category"]];
           doExecute = true;
       }else if ([@"setMember" isEqualToString:call.method]) {
           [WiseTracker setMember:[self getString:call param1:@"isMember"]];
           doExecute = true;
       }else if ([@"setGender" isEqualToString:call.method]) {
           [WiseTracker setGender:[self getString:call param1:@"gender"]];
           doExecute = true;
       }else if ([@"setAge" isEqualToString:call.method]) {
           [WiseTracker setAge:[self getString:call param1:@"age"]];
           doExecute = true;
       }else if ([@"setUserAttribute" isEqualToString:call.method]) {
           [WiseTracker setUserAttribute:[self getString:call param1:@"key"] attribute:[self getString:call param1:@"attribute"]];
           doExecute = true;
       }else if ([@"setCustomMvtTag" isEqualToString:call.method]) {
           [WiseTracker setCustomMvtTag:[self getString:call param1:@"key"] value:[self getString:call param1:@"mvtValue"]];
           doExecute = true;
       }else if ([@"setGoalCustomMvtTag" isEqualToString:call.method]) {
           [WiseTracker setGoalCustomMvtTag:[self getString:call param1:@"key"] value:[self getString:call param1:@"mvtValue"]];
           doExecute = true;
       }else if ([@"setOrderCustomMvtTag" isEqualToString:call.method]) {
           [WiseTracker setOrderCustomMvtTag:[self getString:call param1:@"key"] value:[self getString:call param1:@"mvtValue"]];
           doExecute = true;
       }else if ([@"setOrderCustomMvtTagArray" isEqualToString:call.method]) {
           [WiseTracker setOrderCustomMvtTagArray:[self getString:call param1:@"key"] value:[self getList:call param1:@"mvtValue"]];
           doExecute = true;
       }else if ([@"containsGoalDataById" isEqualToString:call.method]) {
           [WiseTracker containsGoalData:[self getString:call param1:@"key"] byId:[self getString:call param1:@"pageId"]];
           doExecute = true;
       }else if ([@"setExhibit" isEqualToString:call.method]) {
           [WiseTracker setExhibit:[self getString:call param1:@"exhibit"]];
           doExecute = true;
       }else if ([@"setGoalSearchKeyword" isEqualToString:call.method]) {
           [WiseTracker setGoalSearchKeyword:[self getString:call param1:@"keyword"]];
           doExecute = true;
       }else if ([@"setOrderSearchKeyword" isEqualToString:call.method]) {
           [WiseTracker setOrderSearchKeyword:[self getString:call param1:@"keyword"]];
           doExecute = true;
       }else if ([@"setOrderSearchKeywordArray" isEqualToString:call.method]) {
           [WiseTracker setOrderSearchKeywordArray:[self getList:call param1:@"keyword"]];
           doExecute = true;
       }else if ([@"useIkwdWithConversion" isEqualToString:call.method]) {
           [WiseTracker useIkwdWithConversion:[self getString:call param1:@"target"]];
           doExecute = true;
       }else if ([@"useMvt1WithConversion" isEqualToString:call.method]) {
           [WiseTracker useMvt1WithConversion:[self getString:call param1:@"target"]];
           doExecute = true;
       }else if ([@"useMvt2WithConversion" isEqualToString:call.method]) {
           [WiseTracker useMvt2WithConversion:[self getString:call param1:@"target"]];
           doExecute = true;
       }else if ([@"useMvt3WithConversion" isEqualToString:call.method]) {
           [WiseTracker useMvt3WithConversion:[self getString:call param1:@"target"]];
           doExecute = true;
       }else if ([@"setInternalEvent" isEqualToString:call.method]) {
           [WiseTracker setInternalEvent:[self getString:call param1:@"value"]];
           doExecute = true;
       }else if ([@"sendClickData" isEqualToString:call.method]) {
           [WiseTracker sendClickData:[self getString:call param1:@"eventCode"] eventName:[self getString:call param1:@"eventName"]];
           doExecute = true;
       }else if ([@"sendImmediatelyClickData" isEqualToString:call.method]) {
           doExecute = true;
       }
    }
    @catch (NSException * e) {
        NSLog(@"Error: %@%@", [e name], [e reason]);
    }
    @finally {
        if( doExecute ){
            result(call.method);
        }else{
          result(FlutterMethodNotImplemented);
        }
    }
//  if ([@"getPlatformVersion" isEqualToString:call.method]) {
//      NSLog(@"getPlatformVersion");
//    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//  } else if ([@"init" isEqualToString:call.method]) {
//      NSString *appKey = call.arguments[@"appKey"];
//      [WiseTracker applicationKey:appKey];
//      [WiseTracker setApplication:UIApplication.sharedApplication];
//      [WiseTracker initEnd];
//      [WiseTracker startPage:@"MAIN"];
//  } else if ([@"startPage" isEqualToString:call.method]) {
//      NSString *pageId = call.arguments[@"pageId"];
//      [WiseTracker startPage:pageId];
//  } else if ([@"endPage" isEqualToString:call.method]) {
//      NSString *pageId = call.arguments[@"pageId"];
//      [WiseTracker endPage:pageId];
//  } else if ([@"setGoalProduct" isEqualToString:call.method]) {
//      NSString *code = call.arguments[@"code"];
//      [WiseTracker setGoalProduct:code];
//  } else if ([@"setGoalProductArray" isEqualToString:call.method]) {
//      NSArray *array = [[NSArray alloc] init];
//      array = call.arguments[@"code"];
//      [WiseTracker setGoalProductArray:array];
//  } else if ([@"sendGoalData" isEqualToString:call.method]) {
//      [WiseTracker sendGoalData];
//  }
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"" isEqualToString:call.method]) {
//
//  } else if ([@"sendTransaction" isEqualToString:call.method]) {
//      [WiseTracker sendTransaction];
//  } else if ([@"setProduct" isEqualToString:call.method]) {
//      NSString *productCode = call.arguments[@"productCode"];
//      NSString *productName = call.arguments[@"productName"];
//
//      [WiseTracker setProduct:productCode name:productName];
//  } else {
//    result(FlutterMethodNotImplemented);
//  }
}

@end
