import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/widgets/sub_template_widget.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SubTemplateWidget(
      title: 'Notícias',
      backButton: () => Modular.to.navigate('/template/home-news'),
      child: Container(),
    );
  }
}
