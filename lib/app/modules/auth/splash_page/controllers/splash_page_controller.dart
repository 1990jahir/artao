import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/utils/crud_manager.dart';

class SplashPageController extends GetxController with GetSingleTickerProviderStateMixin {
  var w = ScreenUtil().screenWidth;


  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
          () async {
        var uid = await CrudManager.getId();
        if (uid == null) {
          await Get.offAllNamed(
            '/signin',
          );
        } else {
          await Get.offAllNamed(
            '/navigation-bar',
          );
        }
      },
    );
  }
}
