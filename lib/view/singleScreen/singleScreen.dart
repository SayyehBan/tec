// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';

class SingleScreen extends StatelessWidget {
  const SingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              const UseCachedNetworkImage(url: ""),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: GradiantColors.singleAppBarGradiant)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ]),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "رازهای اساسینز کرید والهالا؛ از هری پاتر و ارباب حلقه‌ها تا دارک سولز",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Assets.images.profileAvatar.image(height: 50),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "مهسا امینی",
                  style: themeData.textTheme.headlineMedium,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "دو روز پیش",
                  style: themeData.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: HtmlWidget(
              '''
            <h1>Heading 1</h1>
  <h2>Heading 2</h2>
  <h3>Heading 3</h3>
          ''',
              textStyle: themeData.textTheme.headlineMedium,
              enableCaching: true,
              onLoadingBuilder: (context, element, loadingProgress) =>
                  const Loading(),
            ),
          )
        ],
      )),
    );
  }
}
