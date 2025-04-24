import 'package:nmea/nmea.dart' as nmea;

class TemperatureSentence extends nmea.CustomChecksumSentence {
  TemperatureSentence({required super.raw, super.validateChecksums = true})
      : super(identifier: id);

  static const String id = 'IIMTW';

  String get temperature => fields[1];
}