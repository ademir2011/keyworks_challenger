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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
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
                      Container(),
                      SizedBox(
                        width: 290,
                        child: Text(
                          'GEOMAGNETIC STORM AND RECENTLY DEPLOYED STARLINK SATELLITES',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Fonte: Space X',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Lorem ipsum dolor',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '''In feugiat augue eu tincidunt congue. Nam feugiat lobortis diam, non luctus dui semper at. 
Vivamus aliquet, leo nec imperdiet interdum, quam nisl cursus diam, at commodo ante velit 
at sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus convallis nibh vitae lorem cursus, 
ultrices congue eros ornare. Nulla sit amet nisl sit amet arcu consequat faucibus eget sit amet justo. 
Curabitur dolor leo, placerat vel nibh commodo, rhoncus bibendum neque. Aenean hendrerit urna 
tortor, ac interdum odio luctus sed. Proin lobortis id risus quis vestibulum. Proin felis elit, 
porta a velit eu, aliquam vestibulum felis. Etiam eu placerat leo. Sed sit amet eros sed sapien porttitor 
volutpat non a massa. Vivamus magna mi, ullamcorper non dictum ut, blandit sit amet nisl. Duis lorem purus, 
porta in tellus ut, imperdiet consequat erat.  Proin lobortis id risus quis vestibulum. Proin felis elit, 
porta a velit eu, aliquam vestibulum felis. Etiam eu placerat leo. Sed sit amet eros sed sapien porttitor 
volutpat non a massa. Vivamus magna mi, ullamcorper non dictum ut, blandit sit amet nisl. Duis lorem purus, 
porta in tellus ut, imperdiet consequat erat.''',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
