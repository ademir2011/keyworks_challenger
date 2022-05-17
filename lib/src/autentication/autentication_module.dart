import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/autentication/presenter/pages/signin_page.dart';

class AutenticationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SigninPage()),
      ];
}
