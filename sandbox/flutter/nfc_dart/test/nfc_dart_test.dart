import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_dart/nfc_dart.dart';
import 'package:nfc_dart/nfc_dart_platform_interface.dart';
import 'package:nfc_dart/nfc_dart_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNfcDartPlatform
    with MockPlatformInterfaceMixin
    implements NfcDartPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NfcDartPlatform initialPlatform = NfcDartPlatform.instance;

  test('$MethodChannelNfcDart is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNfcDart>());
  });

  test('getPlatformVersion', () async {
    NfcDart nfcDartPlugin = NfcDart();
    MockNfcDartPlatform fakePlatform = MockNfcDartPlatform();
    NfcDartPlatform.instance = fakePlatform;

    expect(await nfcDartPlugin.getPlatformVersion(), '42');
  });
}
