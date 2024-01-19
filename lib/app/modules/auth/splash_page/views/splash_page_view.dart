import 'package:artao/app/data/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/utils/asset_manager.dart';
import '../../../../data/utils/color_manager.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: controller.w,
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          image: DecorationImage(
            image: AssetImage(
              AssetManager.logo,
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 95.h,
              width: 100.w,
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 15.h,
                right: 5.w,
              ),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(
                  20.w,
                ),
              ),
              child: SvgPicture.asset(
                AssetManager.logo,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5.h,
              ),
              child: Text(
                StringManager.appTitle,
                style: GoogleFonts.outfit(
                  color: ColorManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
