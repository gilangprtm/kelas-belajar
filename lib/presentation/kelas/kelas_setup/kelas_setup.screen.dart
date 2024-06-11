import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/kelas_setup.controller.dart';

class KelasSetupScreen extends GetView<KelasSetupController> {
  const KelasSetupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KelasSetupScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KelasSetupScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
