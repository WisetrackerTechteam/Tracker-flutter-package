package kr.co.wisetracker.wisetracker;

import android.content.Context;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import kr.co.wisetracker.tracker.WiseTracker;

/** WisetrackerPlugin */
public class WisetrackerPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context applicationContext;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "wisetracker");
    channel.setMethodCallHandler(this);
    this.applicationContext = flutterPluginBinding.getApplicationContext();
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "wisetracker");
    channel.setMethodCallHandler(new WisetrackerPlugin());
  }

  private String getString(MethodCall call, String key){
    String result = "";
    if( call.arguments != null && call.hasArgument(key) ){
      result = (String)(call.argument(key));
    }
    return result;
  }
  private String[] getStringArray(MethodCall call, String key){
    String[] result = null;
    if( call.arguments != null && call.hasArgument(key)  ){
      result = (String[])(call.argument(key));
    }
    return result;
  }
  private double getDouble(MethodCall call, String key){
    double result = 0;
    if( call.arguments != null && call.hasArgument(key)  ){
      result = (double)(call.argument(key));
    }
    return result;
  }
  private double[] getDoubleArray(MethodCall call , String key ){
    double[] result = null;
    if( call.arguments != null && call.hasArgument(key)  ) {
      result = (double[])(call.argument(key));
    }
    return result;
  }
  private int getInt(MethodCall call, String key){
    int result = 0;
    if( call.arguments != null && call.hasArgument(key)  ){
      result = (int)(call.argument(key));
    }
    return result;
  }
  private int[] getIntArray(MethodCall call , String key ){
    int[] result = null;
    if( call.arguments != null && call.hasArgument(key)  ) {
        result = (int[])(call.argument(key));
    }
    return result;
  }
  private long getLong(MethodCall call, String key){
    long result = 0;
    if( call.arguments != null && call.hasArgument(key)  ){
      result = (long)(call.argument(key));
    }
    return result;
  }
  private boolean getBoolean(MethodCall call, String key){
    boolean flag = false;
    if( call.arguments != null && call.hasArgument(key)  ){
        flag = (boolean)(call.argument(key));
    }
  static void endPage
    return flag;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    boolean doExecute = false;
    try{
      switch (call.method){
        case "initialization":  WiseTracker.initAtApplication(this.applicationContext); doExecute = true; break; // Wisetracker SDK Init
        case "initStart":  WiseTracker.initStart(this.applicationContext);  doExecute = true; break;
        case "initEnd": WiseTracker.initEnd();  doExecute = true; break;
        case "initPushSet":  WiseTracker.initPushSet(this.getString(call,"key"), this.getString(call,"value"));  doExecute = true; break;
        case "putInitData":  WiseTracker.putInitData(this.getString(call,"key"), this.getString(call,"value"));  doExecute = true; break;
        case "sendGoalData": WiseTracker.sendGoalData(); doExecute = true; break;
        case "sendTransaction": WiseTracker.sendTransaction(); doExecute = true; break;
        case "startPage": WiseTracker.startPage(this.getString(call,"obj")); doExecute = true; break;
        case "endPage": WiseTracker.endPage(this.getString(call,"pageCode")); doExecute = true; break;
        case "endStartPage": WiseTracker.endStartPage(this.getString(call,"pageCode")); doExecute = true; break;
        case "containsGoalData": WiseTracker.containsGoalData(this.getString(call,"key")); doExecute = true; break;
        case "putGoalData": WiseTracker.putGoalData(this.getString(call,"key"), this.getString(call,"value")); doExecute = true; break;
        case "putGoalDataArray": WiseTracker.putGoalDataArray(this.getString(call,"key"), this.getStringArray(call,"value")); doExecute = true; break;
        case "containsPageData": WiseTracker.containsPageData(this.getString(call,"key")); doExecute = true; break;
        case "putPageData": WiseTracker.putPageData(this.getString(call,"key"), this.getString(call,"value")); doExecute = true; break;
        case "containsRevenueData": WiseTracker.containsRevenueData(this.getString(call,"key")); doExecute = true; break;
        case "putRevenueData": WiseTracker.putRevenueData(this.getString(call,"key"), this.getString(call,"value")); doExecute = true; break;
        case "putRevenueDataArray": WiseTracker.putRevenueDataArray(this.getString(call,"key"), this.getStringArray(call,"value")); doExecute = true; break;
        case "putSessionData": WiseTracker.putSessionData(this.getString(call,"key"), this.getString(call,"value")); doExecute = true; break;
        case "putInstallReferrer": WiseTracker.putInstallReferrer(this.getString(call,"referrer")) ; doExecute = true; break;
        case "putSessionReferrer": WiseTracker.putSessionReferrer(this.getString(call,"referrer")); doExecute = true; break;
        case "setAdChannel": WiseTracker.setAdChannel(this.getString(call,"code")); doExecute = true; break;
        case "setAdChannelPeriod": WiseTracker.setAdChannelPeriod(this.getString(call,"code"), this.getInt(call,"period")); doExecute = true; break;
        case "setAdCampaign": WiseTracker.setAdCampaign(this.getString(call,"code")); doExecute = true; break;
        case "setAdCampaignPeriod": WiseTracker.setAdCampaignPeriod(this.getString(call,"code"), this.getInt(call,"period")); doExecute = true; break;
        case "setAdKeyword": WiseTracker.setAdKeyword(this.getString(call,"code")); doExecute = true; break;
        case "setAdKeywordPeriod": WiseTracker.setAdKeywordPeriod(this.getString(call,"code"), this.getInt(call,"period")); doExecute = true; break;
        case "setAdType": WiseTracker.setAdType(this.getString(call,"code")); doExecute = true; break;
        case "setAdTypePeriod": WiseTracker.setAdTypePeriod(this.getString(call,"code"), this.getInt(call,"period")); doExecute = true; break;
        case "setGoal": WiseTracker.setGoal(this.getString(call,"key"), this.getDouble(call,"value")); doExecute = true; break;
        case "setAcceptPushReceived": WiseTracker.setAcceptPushReceived( this.getBoolean(call,"value") ); doExecute = true; break;
        case "setGoalCustomMvtTag": WiseTracker.setGoalCustomMvtTag( this.getString(call,"key"), this.getString(call,"mvtValue") ); doExecute = true; break;
        case "setGoalPageIdentity": WiseTracker.setGoalPageIdentity( this.getString(call,"value") ); doExecute = true; break;
        case "setGoalProduct": WiseTracker.setGoalProduct( this.getString(call,"code") ); doExecute = true; break;
        case "setGoalProductArray": WiseTracker.setGoalProductArray( this.getStringArray(call,"code") ); doExecute = true; break;
        case "setGoalContents": WiseTracker.setGoalContents( this.getString(call,"value") ); doExecute = true; break;
        case "setGoalContentsArray": WiseTracker.setGoalContentsArray( this.getStringArray(call,"value") ); doExecute = true; break;
        case "setGoalProductType": WiseTracker.setGoalProductType(this.getString(call,"type")); doExecute = true; break;
        case "setGoalProductType2": WiseTracker.setGoalProductType2(this.getString(call,"type")); doExecute = true; break;
        case "setGoalProductType3": WiseTracker.setGoalProductType3(this.getString(call,"type")); doExecute = true; break;
        case "setGoalProductType4": WiseTracker.setGoalProductType4(this.getString(call,"type")); doExecute = true; break;
        case "setGoalProductType5": WiseTracker.setGoalProductType5(this.getString(call,"type")); doExecute = true; break;
        case "setGoalProductTypeArray": WiseTracker.setGoalProductTypeArray(this.getStringArray(call,"type")); doExecute = true; break;
        case "setGoalProductTypeArray2": WiseTracker.setGoalProductTypeArray2(this.getStringArray(call,"type")); doExecute = true; break;
        case "setGoalProductTypeArray3": WiseTracker.setGoalProductTypeArray3(this.getStringArray(call,"type")); doExecute = true; break;
        case "setGoalProductTypeArray4": WiseTracker.setGoalProductTypeArray4(this.getStringArray(call,"type")); doExecute = true; break;
        case "setGoalProductTypeArray5": WiseTracker.setGoalProductTypeArray5(this.getStringArray(call,"type")); doExecute = true; break;
        case "setGoalProductCategory": WiseTracker.setGoalProductCategory( this.getString(call,"code") ); doExecute = true; break;
        case "setGoalProductCategoryArray": WiseTracker.setGoalProductCategoryArray( this.getStringArray(call,"code") ); doExecute = true; break;
        case "setExhibit": WiseTracker.setExhibit(this.getString(call,"exhibit")); doExecute = true; break;
        case "setProduct": WiseTracker.setProduct( this.getString(call,"code"), this.getString(call,"name") ); doExecute = true; break;
        case "setProductType": WiseTracker.setProductType( this.getString(call,"type") ); doExecute = true; break;
        case "setProductType2": WiseTracker.setProductType2( this.getString(call,"type") ); doExecute = true; break;
        case "setProductType3": WiseTracker.setProductType3( this.getString(call,"type") ); doExecute = true; break;
        case "setProductType4": WiseTracker.setProductType4( this.getString(call,"type") ); doExecute = true; break;
        case "setProductType5": WiseTracker.setProductType5( this.getString(call,"type") ); doExecute = true; break;
        case "setProductCategory": WiseTracker.setProductCategory( this.getString(call,"code"), this.getString(call,"name") ); doExecute = true; break;
        case "setOrderCustomMvtTag": WiseTracker.setOrderCustomMvtTag( this.getString(call,"key"), this.getString(call,"mvtValue") ); doExecute = true; break;
        case "setOrderCustomMvtTagArray": WiseTracker.setOrderCustomMvtTagArray( this.getString(call,"key"), this.getStringArray(call,"mvtValue") ); doExecute = true; break;
        case "setOrderNPaymentId": WiseTracker.setOrderNPaymentId( this.getString(call,"code") ); doExecute = true; break;
        case "createNPaySequenceKey": WiseTracker.createNPaySequenceKey(); doExecute = true; break;
        case "executeCallbackWithNPayKey": WiseTracker.executeCallbackWithNPayKey(this.getString(call,"callback")); doExecute = true; break;
        case "setOrderProduct": WiseTracker.setOrderProduct( this.getString(call,"code") ); doExecute = true; break;
        case "setOrderProductArray": WiseTracker.setOrderProductArray( this.getStringArray(call,"code") ); doExecute = true; break;
        case "setOrderContents": WiseTracker.setOrderContents( this.getString(call,"value") ); doExecute = true; break;
        case "setOrderContentsArray": WiseTracker.setOrderContentsArray( this.getStringArray(call,"value") ); doExecute = true; break;
        case "setOrderProductType": WiseTracker.setOrderProductType( this.getString(call,"type") ) ; doExecute = true; break;
        case "setOrderProductType2": WiseTracker.setOrderProductType2( this.getString(call,"type") ) ; doExecute = true; break;
        case "setOrderProductType3": WiseTracker.setOrderProductType3( this.getString(call,"type") ) ; doExecute = true; break;
        case "setOrderProductType4": WiseTracker.setOrderProductType4( this.getString(call,"type") ) ; doExecute = true; break;
        case "setOrderProductType5": WiseTracker.setOrderProductType5( this.getString(call,"type") ) ; doExecute = true; break;
        case "setOrderProductTypeArray": WiseTracker.setOrderProductTypeArray( this.getStringArray(call,"type") ) ; doExecute = true; break;
        case "setOrderProductTypeArray2": WiseTracker.setOrderProductTypeArray2( this.getStringArray(call,"type") ) ; doExecute = true; break;
        case "setOrderProductTypeArray3": WiseTracker.setOrderProductTypeArray3( this.getStringArray(call,"type") ) ; doExecute = true; break;
        case "setOrderProductTypeArray4": WiseTracker.setOrderProductTypeArray4( this.getStringArray(call,"type") ) ; doExecute = true; break;
        case "setOrderProductTypeArray5": WiseTracker.setOrderProductTypeArray5( this.getStringArray(call,"type") ) ; doExecute = true; break;
        case "setOrderProductCategory": WiseTracker.setOrderProductCategory( this.getString(call,"code") ); doExecute = true; break;
        case "setOrderProductCategoryArray": WiseTracker.setOrderProductCategoryArray( this.getStringArray(call,"code") ); doExecute = true; break;
        case "setOrderAmount": WiseTracker.setOrderAmount( this.getDouble(call,"value") ); doExecute = true; break;
        case "setOrderAmountArray": WiseTracker.setOrderAmountArray( this.getDoubleArray(call,"value") ); doExecute = true; break;
        case "setOrderConversionData": WiseTracker.setOrderConversionData( this.getString(call,"key"), this.getDouble(call,"value") ); doExecute = true; break;
        case "setOrderConversionDataArray": WiseTracker.setOrderConversionDataArray( this.getString(call,"key"), this.getDoubleArray(call,"value") ); doExecute = true; break;
        case "useIkwdWithConversion": WiseTracker.useIkwdWithConversion(this.getString(call,"target")); doExecute = true; break;
        case "useMvt1WithConversion": WiseTracker.useMvt1WithConversion(this.getString(call,"target")); doExecute = true; break;
        case "useMvt2WithConversion": WiseTracker.useMvt2WithConversion(this.getString(call,"target")); doExecute = true; break;
        case "useMvt3WithConversion": WiseTracker.useMvt3WithConversion(this.getString(call,"target")); doExecute = true; break;
        case "setOrderNo": WiseTracker.setOrderNo( this.getString(call,"value") ); doExecute = true; break;
        case "setOrderQuantity": WiseTracker.setOrderQuantity( this.getInt(call,"value") ); doExecute = true; break;
        case "setOrderQuantityArray": WiseTracker.setOrderQuantityArray( this.getIntArray(call,"value") ); doExecute = true; break;
        case "setContents": WiseTracker.setContents( this.getString(call,"value") ); doExecute = true; break;
        case "setPageIdentity": WiseTracker.setPageIdentity( this.getString(call,"value") ); doExecute = true; break;
        case "setPageUrl": WiseTracker.setPageUrl( this.getString(call,"url") ); doExecute = true; break;
        case "setPageLoadTime": WiseTracker.setPageLoadTime( this.getLong(call,"time") ); doExecute = true; break;
        case "setSearchKeyword": WiseTracker.setSearchKeyword(this.getString(call,"keyword")); doExecute = true; break;
        case "setGoalSearchKeyword": WiseTracker.setGoalSearchKeyword( this.getString(call,"keyword") ); doExecute = true; break;
        case "setOrderSearchKeyword": WiseTracker.setOrderSearchKeyword( this.getString(call,"keyword") ); doExecute = true; break;
        case "setOrderSearchKeywordArray": WiseTracker.setOrderSearchKeywordArray( this.getStringArray(call,"keyword") ); doExecute = true; break;
        case "setSearchKeywordResult": WiseTracker.setSearchKeywordResult(this.getInt(call,"count")); doExecute = true; break;
        case "setSearchKeywordCategory": WiseTracker.setSearchKeywordCategory(this.getString(call,"category")); doExecute = true; break;
        case "setMember": WiseTracker.setMember( this.getString(call,"isMember") ); doExecute = true; break;
        case "setGender": WiseTracker.setGender( this.getString(call,"gender") ); doExecute = true; break;
        case "setAge": WiseTracker.setAge( this.getString(call,"age") ); doExecute = true; break;
        case "setUserAttribute": WiseTracker.setUserAttribute( this.getString(call,"key"), this.getString(call,"attribute") ); doExecute = true; break;
        case "setCustomMvtTag": WiseTracker.setCustomMvtTag( this.getString(call,"key"), this.getString(call,"mvtValue") ); doExecute = true; break;
        case "setInternalEvent": WiseTracker.setInternalEvent(this.getString(call,"value")); doExecute = true; break;
        case "setInternalEventWithTime": WiseTracker.setInternalEventWithTime(this.getString(call,"value"), this.getInt(call,"day")); doExecute = true; break;
        case "setOrderDate": WiseTracker.setOrderDate( this.getString(call,"orderDate") ); doExecute = true; break;
        case "setOrderDateArray": WiseTracker.setOrderDateArray( this.getString(call,"orderDate"), this.getInt(call,"itemCount") ); doExecute = true; break;
        case "extensionOfSessionTime": WiseTracker.extensionOfSessionTime(this.getLong(call,"time")); doExecute = true; break;
        case "setPaymentTypeForOllehTv": WiseTracker.setPaymentTypeForOllehTv(this.getString(call,"mCd"), this.getString(call,"sCd")); doExecute = true; break;
        case "setPushMessageClickData":
          if( call.arguments != null ){
              if( call.hasArgument("pushNo")){
                WiseTracker.setPushMessageClickData(this.getString(call,"pushNo"));
              }else{
                WiseTracker.setPushMessageClickData(this.getString(call,"mat_source"), this.getString(call,"mat_campaign"), this.getString(call,"mat_medium"), this.getString(call,"mat_kwd"));
              }
              doExecute = true;
              break;
          }
        case "sendClickData": WiseTracker.sendClickData( this.getString(call,"eventCode"), this.getString(call,"eventName") ); doExecute = true; break;
        case "sendImmediatelyClickData": WiseTracker.sendImmediatelyClickData(this.getString(call,"key"), this.getString(call,"value")); doExecute = true; break;
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally {
      // callback return to flutter layer
      if( doExecute ){
        result.success(call.method+" API calling success.");
      }else{
        result.notImplemented();
      }
    }
  }



  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
