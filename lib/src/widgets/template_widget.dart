import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/widgets/bottom_navigation_bar_widget.dart';

enum PageEnum {
  home,
  maps,
  configurations;

  String get nome {
    if (index == 0) {
      return 'Home';
    } else if (index == 1) {
      return 'Mapa';
    } else if (index == 2) {
      return 'Configurações';
    } else {
      return '';
    }
  }
}

class TemplateWidget extends StatefulWidget {
  const TemplateWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TemplateWidget> createState() => _TemplateWidgetState();
}

class _TemplateWidgetState extends State<TemplateWidget> {
  final menuIndex = MenuIndex(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: menuIndex,
          builder: (ctx, value, w) => Text(PageEnum.values[value].nome),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: menuIndex,
        builder: (ctx, value, w) => BottomNavigationBarWidget(
          index: value,
          onTap: (index) {
            menuIndex.value = index;
            if (index == PageEnum.home.index) {
              Modular.to.navigate('/template/home_news/');
            } else if (index == PageEnum.maps.index) {
              Modular.to.navigate('/template/rocket/rocket_maps/');
            } else if (index == PageEnum.configurations.index) {
              Modular.to.navigate('/template/configuration/');
            }
          },
        ),
      ),
    );
  }
}

class MenuIndex extends ValueNotifier<int> {
  MenuIndex(super.value);
}
