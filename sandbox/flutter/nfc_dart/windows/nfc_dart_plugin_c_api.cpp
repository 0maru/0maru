#include "include/nfc_dart/nfc_dart_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "nfc_dart_plugin.h"

void NfcDartPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  nfc_dart::NfcDartPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
