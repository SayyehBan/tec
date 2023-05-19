// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/loading.dart';

class UseCachedNetworkImage extends StatelessWidget {
  const UseCachedNetworkImage({
    super.key,
    required this.url,
    required this.containerUse,
  });

  final String url;
  final bool containerUse;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => containerUse
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              )
            : Image(image: imageProvider),
        placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error) =>
            Assets.images.singlePlaceHolder.image(fit: BoxFit.cover));
  }
}
