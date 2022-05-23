import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/pages/rocket_maps_page.dart';

class RocketModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/rocket_maps/', child: (context, args) => const RocketMapsPage()),
      ];
}
