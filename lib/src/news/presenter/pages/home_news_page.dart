import 'package:flutter/material.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({Key? key}) : super(key: key);

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const NewsCarrouselWidget(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10),
                child: Text(
                  'Lançamentos',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const LaunchsListWidget(),
          ],
        ),
      ),
    );
  }
}

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
          return Stack(
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
                                duration: const Duration(milliseconds: 500), curve: Curves.linear);
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
                            pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
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
          );
        },
      ),
    );
  }
}

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
        itemBuilder: (ctx, index) {
          return Container(
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
