import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/autentication/autentication_module.dart';
import 'package:keyworkds_challenger/src/config/configuration_module.dart';
import 'package:keyworkds_challenger/src/news/news_module.dart';
import 'package:keyworkds_challenger/src/news/news_module_notemplate.dart';
import 'package:keyworkds_challenger/src/rocket/domain/usecases/get_next_four_rockets.dart';
import 'package:keyworkds_challenger/src/rocket/external/datasources/spacex_api_rocket_launch_datasource.dart';
import 'package:keyworkds_challenger/src/rocket/infra/repositories/rocket_launch_repository.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_bloc.dart';
import 'package:keyworkds_challenger/src/rocket/rocket_module.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => MenuIndex(0)),
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => SpaceApiRocketLaunchDatasource(dio: i())),
        Bind.singleton((i) => RocketLaunchRepository(iRocketLaunchDatasource: i())),
        Bind.singleton((i) => GetNextFourRockets(iRocketLaunchRepository: i())),
        Bind.singleton((i) => RocketBloc(getNextFourRockets: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AutenticationModule()),
        ChildRoute(
          '/template',
          child: (ctx, args) => const TemplateWidget(),
          children: [
            ModuleRoute('/home-news', module: NewsModule()),
            ModuleRoute('/rocket', module: RocketModule()),
            ModuleRoute('/configuration', module: ConfigurationModule()),
          ],
        ),
        ModuleRoute('/notemplate/news-detail', module: NewsModuleNoTemplate()),
      ];
}
