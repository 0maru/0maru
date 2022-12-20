
import 'nfc_dart_platform_interface.dart';

class NfcDart {
  Future<String?> getPlatformVersion() {
    return NfcDartPlatform.instance.getPlatformVersion();
  }
}
