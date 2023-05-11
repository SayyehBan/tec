import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

myLaunchUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint("could not launch $url");
  }
}
