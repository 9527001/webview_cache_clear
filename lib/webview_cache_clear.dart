import 'webview_cache_clear_platform_interface.dart';

class WebviewCacheClear {
  Future<String?> getPlatformVersion() {
    return WebviewCacheClearPlatform.instance.getPlatformVersion();
  }

  static Future<void> clearCache() {
    return WebviewCacheClearPlatform.instance.clearCache();
  }
}
