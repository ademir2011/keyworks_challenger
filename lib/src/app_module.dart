import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/autentication/autentication_module.dart';
import 'package:keyworkds_challenger/src/config/configuration_module.dart';
import 'package:keyworkds_challenger/src/news/news_module.dart';
import 'package:keyworkds_challenger/src/news/news_module_notemplate.dart';
import 'package:keyworkds_challenger/src/rocket/rocket_module.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

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
