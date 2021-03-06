import 'package:flutter/material.dart';

class BottomNavigationBarItemIconWidget extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  const BottomNavigationBarItemIconWidget({
    Key? key,
    this.isSelected = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onTertiary.withOpacity(.9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon),
    );
  }
}
