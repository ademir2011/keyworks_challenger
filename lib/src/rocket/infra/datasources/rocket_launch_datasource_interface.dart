import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';

abstract class IRocketLaunchDatasource {
  Future<List<RocketLaunch>> getNextFourRockets();
}
