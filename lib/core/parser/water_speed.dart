import 'package:nmea/nmea.dart' as nmea;

class WaterSpeedSentence extends nmea.CustomChecksumSentence {
  WaterSpeedSentence({required super.raw, super.validateChecksums = true})
      : super(identifier: id);

  static const String id = 'VWVHW';

  String get waterSpeed => fields[5]; // Speed through water in knots
}