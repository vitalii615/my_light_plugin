import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'light_plugin_method_channel.dart';

abstract class LightPluginPlatform extends PlatformInterface {
  /// Constructs a LightPluginPlatform.
  LightPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static LightPluginPlatform _instance = MethodChannelLightPlugin();

  /// The default instance of [LightPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelLightPlugin].
  static LightPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LightPluginPlatform] when
  /// they register themselves.
  static set instance(LightPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> toggleLight(bool isOn) {
    throw UnimplementedError('toggleLight() has not been implemented.');
  }
}
