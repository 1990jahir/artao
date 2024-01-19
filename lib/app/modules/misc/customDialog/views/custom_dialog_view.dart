import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../data/utils/asset_manager.dart';
import '../../../../data/utils/color_manager.dart';
import '../controllers/custom_dialog_controller.dart';

class CustomDialogView extends GetView {
  CustomDialogView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(CustomDialogController());
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 3,
        sigmaX: 3,
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (
              context,
              child,
              ) {
            return Transform.scale(
              scale: 1.0 - controller.animationController.value * 0.1,
              child: Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 28.w,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.cursor,
                ),
                child: Image.asset(
                  AssetManager.logo,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
