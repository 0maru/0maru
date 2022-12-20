import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nfc_dart_method_channel.dart';

abstract class NfcDartPlatform extends PlatformInterface {
  /// Constructs a NfcDartPlatform.
  NfcDartPlatform() : super(token: _token);

  static final Object _token = Object();

  static NfcDartPlatform _instance = MethodChannelNfcDart();

  /// The default instance of [NfcDartPlatform] to use.
  ///
  /// Defaults to [MethodChannelNfcDart].
  static NfcDartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NfcDartPlatform] when
  /// they register themselves.
  static set instance(NfcDartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
