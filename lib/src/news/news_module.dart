import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/news/presenter/pages/home_news_page.dart';

class NewsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomeNewsPage()),
      ];
}
