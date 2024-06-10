import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/splashscreen.controller.dart';

class SplashscreenScreen extends GetView<SplashscreenController> {
  const SplashscreenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashscreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashscreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
