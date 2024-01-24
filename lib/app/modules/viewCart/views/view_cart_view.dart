import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_cart_controller.dart';

class ViewCartView extends GetView<ViewCartController> {
  const ViewCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewCartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewCartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
