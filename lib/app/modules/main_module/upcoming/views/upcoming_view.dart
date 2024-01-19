import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upcoming_controller.dart';

class UpcomingView extends GetView<UpcomingController> {
  const UpcomingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpcomingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpcomingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
