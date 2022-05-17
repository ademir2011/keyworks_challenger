import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/config/presenter/pages/configuration_page.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ConfigurationPage()),
      ];
}
