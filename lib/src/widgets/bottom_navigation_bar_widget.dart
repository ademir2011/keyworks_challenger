import 'package:flutter/material.dart';
import 'package:keyworkds_challenger/src/widgets/bottom_navigation_bar_item_icon_widget.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final void Function(int) onTap;
  final int index;
  const BottomNavigationBarWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: BottomNavigationBarItemIconWidget(isSelected: widget.index == PageEnum.home.index),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: BottomNavigationBarItemIconWidget(isSelected: widget.index == PageEnum.maps.index),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: BottomNavigationBarItemIconWidget(isSelected: widget.index == PageEnum.configurations.index),
          label: 'Configurações',
        ),
      ],
    );
  }
}
