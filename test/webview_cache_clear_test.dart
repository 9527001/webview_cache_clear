import 'package:flutter_test/flutter_test.dart';
import 'package:webview_cache_clear/webview_cache_clear.dart';
import 'package:webview_cache_clear/webview_cache_clear_platform_interface.dart';
import 'package:webview_cache_clear/webview_cache_clear_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebviewCacheClearPlatform
    with MockPlatformInterfaceMixin
    implements WebviewCacheClearPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WebviewCacheClearPlatform initialPlatform = WebviewCacheClearPlatform.instance;

  test('$MethodChannelWebviewCacheClear is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebviewCacheClear>());
  });

  test('getPlatformVersion', () async {
    WebviewCacheClear webviewCacheClearPlugin = WebviewCacheClear();
    MockWebviewCacheClearPlatform fakePlatform = MockWebviewCacheClearPlatform();
    WebviewCacheClearPlatform.instance = fakePlatform;

    expect(await webviewCacheClearPlugin.getPlatformVersion(), '42');
  });
}
