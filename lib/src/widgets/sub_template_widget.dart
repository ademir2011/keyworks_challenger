import 'package:flutter/material.dart';

class SubTemplateWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final void Function()? backButton;
  const SubTemplateWidget({
    Key? key,
    required this.child,
    required this.title,
    this.backButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Row(
            children: [
              if (backButton != null)
                IconButton(
                  onPressed: backButton,
                  icon: const Icon(Icons.keyboard_backspace_rounded),
                ),
              if (backButton != null) const SizedBox(width: 20),
              Text(title),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.menu),
            ),
          ],
        ),
        Expanded(child: child),
      ],
    );
  }
}
