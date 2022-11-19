import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;

import '../controllers/webview_controller.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return web.WebView(
      initialUrl: controller.url.value.toString(),
      onPageFinished: ((url) => controller.handleHaul27(url)),
    );
  }
}
