// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tec/utilities/loading.dart';

class UseCachedNetworkImage extends StatelessWidget {
  const UseCachedNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      placeholder: (context, url) => const Loading(),
      errorWidget: (context, url, error) => const Icon(
        Icons.image_not_supported_outlined,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}
