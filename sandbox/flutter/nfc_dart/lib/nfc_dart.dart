import 'nfc_dart_platform_interface.dart';

class NfcDart {
  Future<String?> getPlatformVersion() {
    return NfcDartPlatform.instance.getPlatformVersion();
  }

  Future<void> loadNFC() {
    return NfcDartPlatform.instance.loadNFC();
  }

  Future<List<String>> loadCardReader() {
    return NfcDartPlatform.instance.loadCardReader();
  }
}
