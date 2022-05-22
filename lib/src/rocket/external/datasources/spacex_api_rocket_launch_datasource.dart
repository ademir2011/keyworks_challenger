import 'package:dio/dio.dart';
import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';
import 'package:keyworkds_challenger/src/rocket/infra/datasources/rocket_launch_datasource_interface.dart';
import 'package:keyworkds_challenger/src/rocket/infra/models/rocket_launch_model.dart';

class SpaceApiRocketLaunchDatasource implements IRocketLaunchDatasource {
  final Dio dio;

  SpaceApiRocketLaunchDatasource({required this.dio});

  Future<List<RocketLaunch>> getLaunchs() async {
    final response = await dio.get('https://api.spacexdata.com/v4/launches');

    return (response.data as List).map((launch) => RocketLaunchModel.fromMap(launch)).toList();
  }

  Future<List<RocketLaunch>> updateRocketLaunchsByLaunchPadId({
    required List<RocketLaunch> rocketsLaunch,
  }) async {
    final data = (await dio.get('https://api.spacexdata.com/v4/launchpads')).data as List;

    for (var rocketLaunch in rocketsLaunch) {
      final launchsPad = data
          .where(
            (launchpad) => launchpad['id'] == rocketLaunch.launchPadId,
          )
          .first as Map;

      rocketLaunch.latitude = launchsPad['latitude'].toString();
      rocketLaunch.longitude = launchsPad['longitude'].toString();
      rocketLaunch.address = '${launchsPad['full_name']}, ${launchsPad['region']}';
    }

    return rocketsLaunch;
  }

  @override
  Future<List<RocketLaunch>> getNextFourRockets() async {
    var launchs = await getLaunchs();

    final dateNow = DateTime.now();

    launchs = launchs.where((element) => element.date.isAfter(dateNow)).toList();

    if (launchs.length > 4) {
      return await updateRocketLaunchsByLaunchPadId(rocketsLaunch: launchs.getRange(0, 4).toList());
    }

    return launchs;
  }
}
