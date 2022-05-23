import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';

abstract class RocketState {}

class InitialRocketState extends RocketState {}

class LoadingRocketState extends RocketState {}

class SuccessRocketState extends RocketState {
  final List<RocketLaunch> rocketsLaunch;

  SuccessRocketState({
    required this.rocketsLaunch,
  });
}

class ErrorRocketState extends RocketState {
  final String message;
  ErrorRocketState({required this.message});
}
