import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsCarrouselWidget extends StatefulWidget {
  const NewsCarrouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsCarrouselWidget> createState() => _NewsCarrouselWidgetState();
}

class _NewsCarrouselWidgetState extends State<NewsCarrouselWidget> {
  final pageController = PageController();

  final lastPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Modular.to.navigate('/notemplate/news-detail'),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://cdnuploads.aa.com.tr/uploads/Contents/2020/05/30/thumbs_b_c_a4a6996640e91d4ff86a71f5d9d9f84b.jpg?v=225920',
                  fit: BoxFit.cover,
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: index == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            },
                      child: SizedBox(
                        height: 100,
                        width: 50,
                        child: index == 0
                            ? Container()
                            : ImageIcon(
                                const AssetImage('lib\\assets\\icons\\left-arrow.png'),
                                color: Theme.of(context).colorScheme.primary.withOpacity(.64),
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 290,
                      child: Text(
                        'GEOMAGNETIC STORM AND RECENTLY DEPLOYED STARLINK SATELLITES',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    InkWell(
                      onTap: index == lastPageIndex
                          ? null
                          : () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500), curve: Curves.linear);
                            },
                      child: index == lastPageIndex
                          ? Container()
                          : ImageIcon(
                              const AssetImage('lib\\assets\\icons\\right-arrow.png'),
                              color: Theme.of(context).colorScheme.primary.withOpacity(.64),
                              size: 50,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
