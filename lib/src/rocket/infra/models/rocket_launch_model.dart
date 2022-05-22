import 'dart:convert';

import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';

class RocketLaunchModel extends RocketLaunch {
  RocketLaunchModel({
    required super.name,
    required super.date,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.launchPadId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date.millisecondsSinceEpoch,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'launchPadId': launchPadId,
    };
  }

  factory RocketLaunchModel.fromMap(Map<String, dynamic> map) {
    return RocketLaunchModel(
      name: map['name'] ?? '',
      date: DateTime.parse(map['date_utc']),
      address: map['address'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      launchPadId: map['launchpad'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RocketLaunchModel.fromJson(String source) => RocketLaunchModel.fromMap(json.decode(source));
}
