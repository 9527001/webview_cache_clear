import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'webview_cache_clear_platform_interface.dart';

/// An implementation of [WebviewCacheClearPlatform] that uses method channels.
class MethodChannelWebviewCacheClear extends WebviewCacheClearPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('webview_cache_clear');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> clearCache() async {
     final result =  await methodChannel.invokeMethod<void>('clear');
     return result;
  }
}

