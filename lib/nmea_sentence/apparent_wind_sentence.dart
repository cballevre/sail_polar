import 'package:nmea/nmea.dart' as nmea;

class ApparentWindSentence extends nmea.CustomChecksumSentence {
  ApparentWindSentence({required super.raw, super.validateChecksums = true})
      : super(identifier: id);

  static const String id = 'IIVWR';

  String get angle => fields[1]; // Apparent wind angle from 0° to 180°
  String get tack => fields[2]; // Tack direction, L=port, R=starboard
  String get speed => fields[3]; // Wind speed in knots
  String get speedMs => fields[5]; // Wind speed in meters per second
  String get speedkph => fields[7]; // Wind speed in kilometers per hour
}