import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_validation_input_real_time_platform_interface.dart';

/// An implementation of [FlutterValidationInputRealTimePlatform] that uses method channels.
class MethodChannelFlutterValidationInputRealTime extends FlutterValidationInputRealTimePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_validation_input_real_time');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
