import 'dart:async';

import 'package:flutter/services.dart';

class Wisetracker {
  static const MethodChannel _channel = const MethodChannel('wisetracker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    print(version);
    return version;
  }

  static void get testFunction {
    _channel.invokeMethod('testFunction');
  }

  static void initialization(String appKey) {
    _channel.invokeMethod('initialization', <String, dynamic>{
      'appKey': appKey,
    });
  }

  static void get sendTransaction {
    _channel.invokeMethod('sendTransaction');
  }

  static void get sendGoalData {
    _channel.invokeMethod('sendGoalData');
  }

  static void startPage(String pageId) {
    _channel.invokeMethod('startPage', <String, dynamic>{
      'obj': pageId,
    });
  }

  static void endPage(String pageId) {
    _channel.invokeMethod('endPage', <String, dynamic>{
      'pageCode': pageId,
    });
  }

  static void containsGoalData(String key) {
    _channel.invokeMethod('containsGoalData', <String, dynamic>{
      'key': key,
    });
  }

  static void putGoalData(String key, String value) {
    _channel.invokeMethod('containsGoalData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void putPageData(String key, String value) {
    _channel.invokeMethod('putPageData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void getPageData(String key) {
    _channel.invokeMethod('getPageData', <String, dynamic>{
      'key': key,
    });
  }

  static void containsRevenueData(String key) {
    _channel.invokeMethod('containsRevenueData', <String, dynamic>{
      'key': key,
    });
  }

  static void containsPageData(String key) {
    _channel.invokeMethod('containsPageData', <String, dynamic>{
      'key': key,
    });
  }

  static void putSessionData(String key, String value) {
    _channel.invokeMethod('putSessionData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void putSessionReferrer(String value) {
    _channel.invokeMethod('putSessionReferrer', <String, dynamic>{
      'value': value,
    });
  }

  static void setAdChannel(String code) {
    _channel.invokeMethod('setAdChannel', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdChannelPeriod(String code, int period) {
    _channel.invokeMethod('setAdChannelPeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setAdKeyword(String code) {
    _channel.invokeMethod('setAdKeyword', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdKeywordPeriod(String code, int period) {
    _channel.invokeMethod('setAdKeywordPeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setAdType(String code) {
    _channel.invokeMethod('setAdType', <String, dynamic>{
      'code': code,
    });
  }

  static void setAdTypePeriod(String code, int period) {
    _channel.invokeMethod('setAdTypePeriod', <String, dynamic>{
      'code': code,
      'period': period,
    });
  }

  static void setGoal(String key, String value) {
    _channel.invokeMethod('setGoal', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void setGoalProduct(String value) {
    _channel.invokeMethod('setGoalProduct', <String, dynamic>{
      'code': value,
    });
  }

  static void setGoalPageIdentity(String value) {
    _channel.invokeMethod('setGoalPageIdentity', <String, dynamic>{
      'value': value,
    });
  }

  static void setGoalProductArray(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductArray', <String, dynamic>{'code': arrayList});
  }

  static void setGoalContents(String value) {
    _channel.invokeMethod('setGoalContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setGoalContentsArray(List arrayList) {
    _channel.invokeMethod('setGoalContentsArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setGoalProductType(String value) {
    _channel.invokeMethod('setGoalProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType2(String value) {
    _channel.invokeMethod('setGoalProductType2', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType3(String value) {
    _channel.invokeMethod('setGoalProductType3', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType4(String value) {
    _channel.invokeMethod('setGoalProductType4', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductType5(String value) {
    _channel.invokeMethod('setGoalProductType5', <String, dynamic>{
      'type': value,
    });
  }

  static void setGoalProductTypeArray(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductTypeArray', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray2(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductTypeArray2', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray3(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductTypeArray3', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray4(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductTypeArray4', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductTypeArray5(List arrayList) {
    _channel.invokeMethod(
        'setGoalProductTypeArray5', <String, dynamic>{'type': arrayList});
  }

  static void setGoalProductCategory(String value) {
    _channel.invokeMethod('setGoalProductCategory', <String, dynamic>{
      'code': value,
    });
  }

  static void setGoalProductCategoryArray(List arrayList) {
    _channel.invokeMethod('setGoalProductCategoryArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setProduct(String code, String name) {
    _channel.invokeMethod('setProduct', <String, dynamic>{
      'code': code,
      'name': name,
    });
  }

  static void setProductType(String value) {
    _channel.invokeMethod('setProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setProductCategory(String code, String value) {
    _channel.invokeMethod('setProductCategory', <String, dynamic>{
      'code': code,
      'name': value,
    });
  }

  static void setOrderNPaymentId(String value) {
    _channel.invokeMethod('setOrderNPaymentId', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProduct(String value) {
    _channel.invokeMethod('setOrderProduct', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProductArray(List arrayList) {
    _channel.invokeMethod('setOrderProductArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setOrderContents(String value) {
    _channel.invokeMethod('setOrderContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderContentsArray(List arrayList) {
    _channel.invokeMethod('setOrderContentsArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setOrderProductType(String value) {
    _channel.invokeMethod('setOrderProductType', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray(List arrayList) {
    _channel.invokeMethod('setOrderProductTypeArray', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType2(String value) {
    _channel.invokeMethod('setOrderProductType2', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray2(List arrayList) {
    _channel.invokeMethod('setOrderProductTypeArray2', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType3(String value) {
    _channel.invokeMethod('setOrderProductType3', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray3(List arrayList) {
    _channel.invokeMethod('setOrderProductTypeArray3', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType4(String value) {
    _channel.invokeMethod('setOrderProductType4', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray4(List arrayList) {
    _channel.invokeMethod('setOrderProductTypeArray4', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductType5(String value) {
    _channel.invokeMethod('setOrderProductType5', <String, dynamic>{
      'type': value,
    });
  }

  static void setOrderProductTypeArray5(List arrayList) {
    _channel.invokeMethod('setOrderProductTypeArray5', <String, dynamic>{
      'type': arrayList,
    });
  }

  static void setOrderProductCategory(String value) {
    _channel.invokeMethod('setOrderProductCategory', <String, dynamic>{
      'code': value,
    });
  }

  static void setOrderProductCategoryArray(List arrayList) {
    _channel.invokeMethod('setOrderProductCategoryArray', <String, dynamic>{
      'code': arrayList,
    });
  }

  static void setOrderNo(String value) {
    _channel.invokeMethod('setOrderNo', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderAmount(double value) {
    _channel.invokeMethod('setOrderAmount', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderAmountArray(List arrayList) {
    _channel.invokeMethod('setOrderAmountArray', <String, dynamic>{
      'value': arrayList,
    });
  }

  static void setOrderConversionData(String key, String value) {
    _channel.invokeMethod('setOrderConversionData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void setOrderConversionDataArray(String key, List arrayList) {
    _channel.invokeMethod('setOrderConversionDataArray', <String, dynamic>{
      'key': key,
      'value': arrayList,
    });
  }

  static void setOrderQuantity(int value) {
    _channel.invokeMethod('setOrderQuantity', <String, dynamic>{
      'value': value,
    });
  }

  static void setOrderQuantityArray(List ArrayList) {
    _channel.invokeMethod('setOrderQuantityArray', <String, dynamic>{
      'value': ArrayList,
    });
  }

  static void setContents(String value) {
    _channel.invokeMethod('setContents', <String, dynamic>{
      'value': value,
    });
  }

  static void setPageIdentity(String value) {
    _channel.invokeMethod('setPageIdentity', <String, dynamic>{
      'value': value,
    });
  }

  static void setSearchKeyword(String value) {
    _channel.invokeMethod('setSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setSearchKeywordResult(int value) {
    _channel.invokeMethod('setSearchKeywordResult', <String, dynamic>{
      'result': value,
    });
  }

  static void setSearchKeywordCategory(String value) {
    _channel.invokeMethod('setSearchKeywordCategory', <String, dynamic>{
      'category': value,
    });
  }

  static void setMember(String value) {
    _channel.invokeMethod('setMember', <String, dynamic>{
      'isMember': value,
    });
  }

  static void setGender(String value) {
    _channel.invokeMethod('setGender', <String, dynamic>{
      'gender': value,
    });
  }

  static void setAge(String value) {
    _channel.invokeMethod('setAge', <String, dynamic>{
      'age': value,
    });
  }

  static void setUserAttribute(String key, String value) {
    _channel.invokeMethod('setUserAttribute', <String, dynamic>{
      'key': key,
      'attribute': value,
    });
  }

  static void setCustomMvtTag(String key, String value) {
    _channel.invokeMethod('setCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setGoalCustomMvtTag(String key, String value) {
    _channel.invokeMethod('setGoalCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setOrderCustomMvtTag(String key, String value) {
    _channel.invokeMethod('setOrderCustomMvtTag', <String, dynamic>{
      'key': key,
      'mvtValue': value,
    });
  }

  static void setOrderCustomMvtTagArray(String key, List arrayList) {
    _channel.invokeMethod('setOrderCustomMvtTagArray', <String, dynamic>{
      'key': key,
      'mvtValue': arrayList,
    });
  }

  static void containsGoalDataById(String key, String pageId) {
    _channel.invokeMethod('containsGoalDataById', <String, dynamic>{
      'key': key,
      'pageId': pageId,
    });
  }

  static void setExhibit(String value) {
    _channel.invokeMethod('setExhibit', <String, dynamic>{
      'exhibit': value,
    });
  }

  static void setGoalSearchKeyword(String value) {
    _channel.invokeMethod('setGoalSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setOrderSearchKeyword(String value) {
    _channel.invokeMethod('setOrderSearchKeyword', <String, dynamic>{
      'keyword': value,
    });
  }

  static void setOrderSearchKeywordArray(List arrayList) {
    _channel.invokeMethod('setOrderSearchKeywordArray', <String, dynamic>{
      'keyword': arrayList,
    });
  }

  static void useIkwdWithConversion(String value) {
    _channel.invokeMethod('useIkwdWithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt1WithConversion(String value) {
    _channel.invokeMethod('useMvt1WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt2WithConversion(String value) {
    _channel.invokeMethod('useMvt2WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void useMvt3WithConversion(String value) {
    _channel.invokeMethod('useMvt3WithConversion', <String, dynamic>{
      'target': value,
    });
  }

  static void setInternalEvent(String value) {
    _channel.invokeMethod('setInternalEvent', <String, dynamic>{
      'value': value,
    });
  }

  static void sendClickData(String eventCode, String eventName) {
    _channel.invokeMethod('sendClickData', <String, dynamic>{
      'eventCode': eventCode,
      'eventName': eventName,
    });
  }

  static void sendImmediatelyClickData(String key, String value) {
    _channel.invokeMethod('sendImmediatelyClickData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }

  static void putRevenueData(String key, String value) {
    _channel.invokeMethod('putRevenueData', <String, dynamic>{
      'key': key,
      'value': value,
    });
  }
}
