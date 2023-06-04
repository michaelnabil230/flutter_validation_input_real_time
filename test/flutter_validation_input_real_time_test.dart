import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time_platform_interface.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterValidationInputRealTimePlatform
    with MockPlatformInterfaceMixin
    implements FlutterValidationInputRealTimePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterValidationInputRealTimePlatform initialPlatform = FlutterValidationInputRealTimePlatform.instance;

  test('$MethodChannelFlutterValidationInputRealTime is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterValidationInputRealTime>());
  });

  test('getPlatformVersion', () async {
    FlutterValidationInputRealTime flutterValidationInputRealTimePlugin = FlutterValidationInputRealTime();
    MockFlutterValidationInputRealTimePlatform fakePlatform = MockFlutterValidationInputRealTimePlatform();
    FlutterValidationInputRealTimePlatform.instance = fakePlatform;

    expect(await flutterValidationInputRealTimePlugin.getPlatformVersion(), '42');
  });
}
