import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_validation_input_real_time_method_channel.dart';

abstract class FlutterValidationInputRealTimePlatform extends PlatformInterface {
  /// Constructs a FlutterValidationInputRealTimePlatform.
  FlutterValidationInputRealTimePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterValidationInputRealTimePlatform _instance = MethodChannelFlutterValidationInputRealTime();

  /// The default instance of [FlutterValidationInputRealTimePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterValidationInputRealTime].
  static FlutterValidationInputRealTimePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterValidationInputRealTimePlatform] when
  /// they register themselves.
  static set instance(FlutterValidationInputRealTimePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
