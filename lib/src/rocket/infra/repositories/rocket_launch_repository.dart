import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';
import 'package:keyworkds_challenger/src/rocket/domain/repositories/rocket_launch_repository_interface.dart';
import 'package:keyworkds_challenger/src/rocket/infra/datasources/rocket_launch_datasource_interface.dart';

class RocketLaunchRepository implements IRocketLaunchRepository {
  final IRocketLaunchDatasource iRocketLaunchDatasource;

  RocketLaunchRepository({required this.iRocketLaunchDatasource});

  @override
  Future<List<RocketLaunch>> getNextFourRockets() async {
    return await iRocketLaunchDatasource.getNextFourRockets();
  }
}
