import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'light_plugin_platform_interface.dart';

/// An implementation of [LightPluginPlatform] that uses method channels.
class MethodChannelLightPlugin extends LightPluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('light_plugin');

  @override
  Future<void> toggleLight(bool isOn) async {
    try {
      await methodChannel.invokeMethod('toggleLight', {'isOn': isOn});
    } on PlatformException catch (e) {
      debugPrint('Error toggling light: ${e.message}');
      rethrow;
    }
  }
}
