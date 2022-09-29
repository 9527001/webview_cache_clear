import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_cache_clear_method_channel.dart';

abstract class WebviewCacheClearPlatform extends PlatformInterface {
  /// Constructs a WebviewCacheClearPlatform.
  WebviewCacheClearPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebviewCacheClearPlatform _instance = MethodChannelWebviewCacheClear();

  /// The default instance of [WebviewCacheClearPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebviewCacheClear].
  static WebviewCacheClearPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebviewCacheClearPlatform] when
  /// they register themselves.
  static set instance(WebviewCacheClearPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> clearCache() {
    throw UnimplementedError('clearCache() has not been implemented.');
  }
}
