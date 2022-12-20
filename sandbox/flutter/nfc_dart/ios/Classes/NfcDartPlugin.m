#import "NfcDartPlugin.h"
#if __has_include(<nfc_dart/nfc_dart-Swift.h>)
#import <nfc_dart/nfc_dart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nfc_dart-Swift.h"
#endif

@implementation NfcDartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNfcDartPlugin registerWithRegistrar:registrar];
}
@end
