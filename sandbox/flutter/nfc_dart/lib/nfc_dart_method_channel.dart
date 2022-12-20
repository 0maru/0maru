import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nfc_dart_platform_interface.dart';

/// An implementation of [NfcDartPlatform] that uses method channels.
class MethodChannelNfcDart extends NfcDartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nfc_dart');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> loadNFC() async {
    await methodChannel.invokeMethod<void>('loadNFC');
  }

  @override
  Future<List<String>> loadCardReader() async {
    return await methodChannel.invokeMethod('loadCardReader').then((value) {
      if (value == null) {
        return [];
      }
      return (value as List<Object?>).map((e) => e as String).toList();
    });
  }
}
