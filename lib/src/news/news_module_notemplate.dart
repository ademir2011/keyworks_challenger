import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/news/presenter/pages/news_detail_page.dart';

class NewsModuleNoTemplate extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const NewsDetailPage()),
      ];
}
