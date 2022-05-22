import 'package:flutter/material.dart';

class LaunchsListWidget extends StatelessWidget {
  const LaunchsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(12.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ax-1',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '8 de Abril de 2022, 13:17',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Icon(Icons.place),
              ],
            ),
          );
        },
      ),
    );
  }
}
