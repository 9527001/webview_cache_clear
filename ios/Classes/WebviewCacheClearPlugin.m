#import "WebviewCacheClearPlugin.h"

@implementation WebviewCacheClearPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"webview_cache_clear"
            binaryMessenger:[registrar messenger]];
  WebviewCacheClearPlugin* instance = [[WebviewCacheClearPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else  if ([@"clear" isEqualToString:call.method]) {
                if (@available(iOS 9.0, *)) {
                    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
                    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
                    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
                    }];
                } else {
                    // Fallback on earlier versions
                }
              result(nil);
}   else {
    result(FlutterMethodNotImplemented);
  }

}

@end
