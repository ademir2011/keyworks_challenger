import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';
import 'package:keyworkds_challenger/src/rocket/domain/repositories/rocket_launch_repository_interface.dart';

abstract class IGetNextFourRockets {
  Future<List<RocketLaunch>> getNextFourRockets();
}

class GetNextFourRockets implements IGetNextFourRockets {
  final IRocketLaunchRepository iRocketLaunchRepository;

  GetNextFourRockets({required this.iRocketLaunchRepository});

  @override
  Future<List<RocketLaunch>> getNextFourRockets() async {
    return await iRocketLaunchRepository.getNextFourRockets();
  }
}
