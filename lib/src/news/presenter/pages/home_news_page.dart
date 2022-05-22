import 'package:flutter/material.dart';
import 'package:keyworkds_challenger/src/news/presenter/widgets/launchs_list_widget.dart';
import 'package:keyworkds_challenger/src/news/presenter/widgets/news_carrousel_widget.dart';
import 'package:keyworkds_challenger/src/widgets/sub_template_widget.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({Key? key}) : super(key: key);

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  @override
  Widget build(BuildContext context) {
    return SubTemplateWidget(
      title: 'Home',
      child: SingleChildScrollView(
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
      ),
    );
  }
}
