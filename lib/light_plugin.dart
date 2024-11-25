import 'dart:io';
import 'light_plugin_platform_interface.dart';

class LightPlugin {
  static Future<void> toggleLight(bool isOn) async {
    if (!Platform.isAndroid) {
      throw UnsupportedError('Ліхтарик підтримується тільки на Android.');
    }
    return LightPluginPlatform.instance.toggleLight(isOn);
  }
}
