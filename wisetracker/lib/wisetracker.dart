import 'dart:async';

import 'package:flutter/services.dart';

class Wisetracker {
  static const MethodChannel _channel = const MethodChannel('wisetracker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    print(version);
    return version;
  }

  static void get testFunction async {
    await _channel.invokeMethod('testFunction');
  }

  static void init(String appKey) async {
    _channel.invokeMethod('init', <String, dynamic>{'appKey': appKey});
  }

  static void get sendTransaction async {
    _channel.invokeMethod('sendTransaction');
  }

  static void get sendGoalData async {
    _channel.invokeMethod('sendGoalData');
  }

  static void startPage(String pageId) async {
    _channel.invokeMethod('startPage', <String, dynamic>{
      'obj': pageId,
    });
  }

  static void endPage(String pageId) async {
    _channel.invokeMethod('endPage', <String, dynamic>{
      'pageCode': pageId,
    });
  }

  static void containsGoalData(String key) async {
    _channel.invokeMethod('containsGoalData', <String, dynamic>{
      'key': key,
    });
  }

  static void putGoalData(String key, String value) async {
    _channel.invokeMethod('containsGoalData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void putPageData(String key, String value) async {
    _channel.invokeMethod('putPageData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void getPageData(String key) async {
    _channel.invokeMethod('getPageData', <String, dynamic>{
      'key': key,
    });
  }

  static void containsRevenueData(String key) async {
    _channel.invokeMethod('containsRevenueData', <String, dynamic>{
      'key': key,
    });
  }

  static void containsPageData(String key) async {
    _channel.invokeMethod('containsPageData', <String, dynamic>{
      'key': key,
    });
  }

  static void putSessionData(String key, String value) async {
    _channel.invokeMethod('putSessionData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void putSessionReferrer(String value) async {
    _channel.invokeMethod('putSessionReferrer', <String, dynamic>{
      'value': value,
    });
  }

  static void setAdChannel(String code) async {
    _channel.invokeMethod('setAdChannel', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdChannelPeriod(String code, int period) async {
    _channel.invokeMethod('setAdChannelPeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setAdKeyword(String code) async {
    _channel.invokeMethod('setAdKeyword', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdKeywordPeriod(String code, int period) async {
    _channel.invokeMethod('setAdKeywordPeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setAdType(String code) async {
    _channel.invokeMethod('setAdType', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdTypePeriod(String code, int period) async {
    _channel.invokeMethod('setAdTypePeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setGoal(String key, String value) async {
    _channel.invokeMethod('setGoal', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void setGoalProduct(String value) async {
    _channel.invokeMethod('setGoalProduct', <String, dynamic>{
      'code': value,
    });
  }

  static void setGoalPageIdentity(String value) async {
    _channel.invokeMethod('setGoalPageIdentity', <String, dynamic>{
      'value': value,
    });
  }

  static void setGoalProductArray(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductArray', <String, dynamic>{'code': arrayList});
  }

  static void setGoalContents(String value) async {
    _channel.invokeMethod('setGoalContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setGoalContentsArray(List arrayList) async {
    _channel.invokeMethod('setGoalContentsArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setGoalProductType(String value) async {
    _channel.invokeMethod('setGoalProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType2(String value) async {
    _channel.invokeMethod('setGoalProductType2', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType3(String value) async {
    _channel.invokeMethod('setGoalProductType3', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType4(String value) async {
    _channel.invokeMethod('setGoalProductType4', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType5(String value) async {
    _channel.invokeMethod('setGoalProductType5', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductTypeArray(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductTypeArray', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray2(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductTypeArray2', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray3(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductTypeArray3', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray4(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductTypeArray4', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray5(List arrayList) async {
    _channel.invokeMethod(
        'setGoalProductTypeArray5', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductCategory(String value) async {
    _channel.invokeMethod('setGoalProductCategory', <String, dynamic>{
      'code': value,
    });
  }

  static void setGoalProductCategoryArray(List arrayList) async {
    _channel.invokeMethod('setGoalProductCategoryArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setProduct(String code, String name) async {
    _channel.invokeMethod('setProduct', <String, dynamic>{
      'code': code,
      'name': name,
    });
  }

  static void setProductType(String value) async {
    _channel.invokeMethod('setProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setProductCategory(String code, String value) async {
    _channel.invokeMethod('setProductCategory', <String, dynamic>{
      'code': code,
      'name': value,
    });
  }

  static void setOrderNPaymentId(String value) async {
    _channel.invokeMethod('setOrderNPaymentId', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProduct(String value) async {
    _channel.invokeMethod('setOrderProduct', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProductArray(List arrayList) async {
    _channel.invokeMethod('setOrderProductArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setOrderContents(String value) async {
    _channel.invokeMethod('setOrderContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderContentsArray(List arrayList) async {
    _channel.invokeMethod('setOrderContentsArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setOrderProductType(String value) async {
    _channel.invokeMethod('setOrderProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray(List arrayList) async {
    _channel.invokeMethod('setOrderProductTypeArray', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType2(String value) async {
    _channel.invokeMethod('setOrderProductType2', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray2(List arrayList) async {
    _channel.invokeMethod('setOrderProductTypeArray2', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType3(String value) async {
    _channel.invokeMethod('setOrderProductType3', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray3(List arrayList) async {
    _channel.invokeMethod('setOrderProductTypeArray3', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType4(String value) async {
    _channel.invokeMethod('setOrderProductType4', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray4(List arrayList) async {
    _channel.invokeMethod('setOrderProductTypeArray4', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType5(String value) async {
    _channel.invokeMethod('setOrderProductType5', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray5(List arrayList) async {
    _channel.invokeMethod('setOrderProductTypeArray5', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductCategory(String value) async {
    _channel.invokeMethod('setOrderProductCategory', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProductCategoryArray(List arrayList) async {
    _channel.invokeMethod('setOrderProductCategoryArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setOrderNo(String value) async {
    _channel.invokeMethod('setOrderNo', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderAmount(double value) async {
    _channel.invokeMethod('setOrderAmount', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderAmountArray(List arrayList) async {
    _channel.invokeMethod('setOrderAmountArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setOrderConversionData(String key, String value) async {
    _channel.invokeMethod('setOrderConversionData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void setOrderConversionDataArray(String key, List arrayList) async {
    _channel.invokeMethod('setOrderConversionDataArray', <String, dynamic>{
      'key': key,
      'value': arrayList,
    });
  }

  static void setOrderQuantity(int value) async {
    _channel.invokeMethod('setOrderQuantity', <String, dynamic>{
      'value': value,
    });
  }

  static void setContents(String value) async {
    _channel.invokeMethod('setContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setPageIdentity(String value) async {
    _channel.invokeMethod('setPageIdentity', <String, dynamic>{
      'value': value,
    });
  }

  static void setSearchKeyword(String value) async {
    _channel.invokeMethod('setSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setSearchKeywordResult(int value) async {
    _channel.invokeMethod('setSearchKeywordResult', <String, dynamic>{
      'result': value,
    });
  }

  static void setSearchKeywordCategory(String value) async {
    _channel.invokeMethod('setSearchKeywordCategory', <String, dynamic>{
      'category': value,
    });
  }

  static void setMember(String value) async {
    _channel.invokeMethod('setMember', <String, dynamic>{
      'isMember': value,
    });
  }

  static void setGender(String value) async {
    _channel.invokeMethod('setGender', <String, dynamic>{
      'gender': value,
    });
  }

  static void setAge(String value) async {
    _channel.invokeMethod('setAge', <String, dynamic>{
      'age': value,
    });
  }

  static void setUserAttribute(String key, String value) async {
    _channel.invokeMethod('setUserAttribute', <String, dynamic>{
      'key': key,
      'attribute': value,
    });
  }

  static void setCustomMvtTag(String key, String value) async {
    _channel.invokeMethod('setCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setGoalCustomMvtTag(String key, String value) async {
    _channel.invokeMethod('setGoalCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setOrderCustomMvtTag(String key, String value) async {
    _channel.invokeMethod('setOrderCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setOrderCustomMvtTagArray(String key, List arrayList) async {
    _channel.invokeMethod('setOrderCustomMvtTagArray', <String, dynamic>{
      'key': key,
      'mvtValue': arrayList,
    });
  }

  static void containsGoalDataById(String key, String pageId) async {
    _channel.invokeMethod('containsGoalDataById', <String, dynamic>{
      'key': key,
      'pageId': pageId,
    });
  }

  static void setExhibit(String value) async {
    _channel.invokeMethod('setExhibit', <String, dynamic>{
      'exhibit': value,
    });
  }

  static void setGoalSearchKeyword(String value) async {
    _channel.invokeMethod('setGoalSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setOrderSearchKeyword(String value) async {
    _channel.invokeMethod('setOrderSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setOrderSearchKeywordArray(List arrayList) async {
    _channel.invokeMethod('setOrderSearchKeywordArray', <String, dynamic>{
      'keyword': arrayList,
    });
  }

  static void useIkwdWithConversion(String value) async {
    _channel.invokeMethod('useIkwdWithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt1WithConversion(String value) async {
    _channel.invokeMethod('useMvt1WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt2WithConversion(String value) async {
    _channel.invokeMethod('useMvt2WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt3WithConversion(String value) async {
    _channel.invokeMethod('useMvt3WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void setInternalEvent(String value) async {
    _channel.invokeMethod('setInternalEvent', <String, dynamic>{
      'value': value,
    });
  }

  static void sendClickData(String eventCode, String eventName) async {
    _channel.invokeMethod('sendClickData', <String, dynamic>{
      'eventCode': eventCode,
      'eventName': eventName,
    });
  }

  static void sendImmediatelyClickData(String key, String value) async {
    _channel.invokeMethod('sendImmediatelyClickData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }
}
