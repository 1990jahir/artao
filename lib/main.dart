import 'package:artao/app/data/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: StringManager.appTitle,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.blueGrey),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
    ),
  );
}
