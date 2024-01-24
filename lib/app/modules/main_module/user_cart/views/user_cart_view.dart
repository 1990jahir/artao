import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_cart_controller.dart';

class UserCartView extends GetView<UserCartController> {
  const UserCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserCartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserCartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
