import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsCarrouselWidget extends StatefulWidget {
  const NewsCarrouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsCarrouselWidget> createState() => _NewsCarrouselWidgetState();
}

class PageValueIndex extends ValueNotifier<int> {
  PageValueIndex(super.value);
}

class _NewsCarrouselWidgetState extends State<NewsCarrouselWidget> {
  final pageController = PageController();
  final pageValueIndex = PageValueIndex(0);

  final lastPageIndex = 2;
  final amountPages = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: pageController,
            itemCount: amountPages,
            onPageChanged: (page) => pageValueIndex.value = page,
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
        ),
        const SizedBox(height: 7.5),
        ValueListenableBuilder(
          valueListenable: pageValueIndex,
          builder: (ctx, value, widget) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              amountPages,
              (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 7.5,
                  width: 7.5,
                  decoration: BoxDecoration(
                    color: value == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onTertiary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
