import 'dart:ui';

import 'package:artao/app/data/utils/asset_manager.dart';
import 'package:artao/app/data/utils/color_manager.dart';
import 'package:artao/app/data/utils/string_manager.dart';
import 'package:artao/app/data/utils/validation_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/misc/customDialog/views/custom_dialog_view.dart';

class WidgetManager {
  WidgetManager._();

  static ScaffoldMessengerState customSnackBar({
    required String title,
    String? body,
    required SnackBarType type,
  }) {
    Color backgroundColor;
    Color primaryColor;
    String assetPath;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = ColorManager.snackBarSB;
        primaryColor = ColorManager.successText;
        assetPath = AssetManager.successSnackBar;
        break;
      case SnackBarType.info:
        backgroundColor = ColorManager.snackBarIB;
        primaryColor = ColorManager.infoText;
        assetPath = AssetManager.infoSnackBar;
        break;
      case SnackBarType.error:
        backgroundColor = ColorManager.snackBarEB;
        primaryColor = ColorManager.errorText;
        assetPath = AssetManager.errorSnackBar;
        break;
      case SnackBarType.notification:
        backgroundColor = ColorManager.snackBarNB;
        primaryColor = ColorManager.notificationText;
        assetPath = AssetManager.notificationSnackBar;
        break;
    }

    return ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          margin: EdgeInsets.zero,
          content: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            margin: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: type == SnackBarType.notification ? 475.h : 10.h,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(
                8.w,
              ),
              border: Border.all(
                color: primaryColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  assetPath,
                  width: type == SnackBarType.notification ? 20.w : 25.w,
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 6.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                        type == SnackBarType.notification
                            ? Text(
                          '$body',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                        )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static Widget authBackground({
    required String title,
    String? subtitle,
    required Widget child,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.white,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 30,right: 30),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 50.w),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AssetManager.pngLogo),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 5.h,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: ColorManager.titleText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 35.h,
                ),
                child: Text(
                  title == StringManager.forgetPassword
                      ? StringManager.enterRegisteredEmail
                      : title == StringManager.verifyOtpTitle
                      ? '${StringManager.enterCode} $subtitle'
                      : title == StringManager.resetPasswordTitle
                      ? StringManager.enterNewPassword
                      : StringManager.greetingText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w400,
                    fontSize: title == StringManager.termsAndConditions
                        ? 0.sp
                        : 18.sp,
                    color: ColorManager.captionText,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  static Widget signUpBackground({
    required String title,
    String? subtitle,
    required Widget child,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.white,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }

  static Widget emailTextField({
    required TextEditingController emailController,
    required FocusNode emailNode,
    required void Function(String)? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: TextFormField(
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onChanged: onChanged,
        controller: emailController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp(
              '[ ]',
            ),
          ),
          FilteringTextInputFormatter.singleLineFormatter,
          FilteringTextInputFormatter.allow(
            RegExp(
              r'^[\w.@]+',
            ),
          ),
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          }
          if (!ValidationManager.validateEmail(value)) {
            return StringManager.enterValidEmail;
          }
          return null;
        },
        focusNode: emailNode,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ColorManager.white,
          hintText: StringManager.userEmail,
          hintStyle: GoogleFonts.workSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.labelText,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.errorText,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.errorText,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorStyle: GoogleFonts.workSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.errorText,
          ),
        ),
        style: GoogleFonts.workSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.labelText,
        ),
        cursorColor: ColorManager.cursor,
      ),
    );
  }

  static Widget dialogTextField({
    required TextEditingController emailController,
    required FocusNode emailNode,
    required void Function(String)? onChanged,
    required String? hintText,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5.h,
      ),
      child: TextFormField(
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onChanged: onChanged,
        controller: emailController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        focusNode: emailNode,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          border: InputBorder.none,
          fillColor: ColorManager.white,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.labelText,
          ),
        ),
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.labelText,
        ),
        cursorColor: ColorManager.cursor,
      ),
    );
  }

  static Widget nameTextField({
    required TextEditingController nameController,
    required FocusNode nameNode,
    required String? hintText,
    required String? errorText,
    required void Function(String)? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: TextFormField(
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onChanged: onChanged,
        controller: nameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(
              "[a-zA-Z]",
            ),
          ),
          TextInputFormatter.withFunction(
                (oldValue, newValue) {
              if (newValue.text.isNotEmpty) {
                return TextEditingValue(
                  text: newValue.text.substring(0, 1).toUpperCase() +
                      newValue.text.substring(1),
                  selection: newValue.selection,
                );
              }
              return newValue;
            },
          ),
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          }
          if (!ValidationManager.validateName(value)) {
            return errorText;
          }
          return null;
        },
        focusNode: nameNode,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ColorManager.white,
          hintText: StringManager.userName,
          hintStyle: GoogleFonts.workSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.labelText,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.errorText,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.errorText,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorStyle: GoogleFonts.workSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.errorText,
          ),
        ),
        style: GoogleFonts.workSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.labelText,
        ),
        cursorColor: ColorManager.cursor,
      ),
    );
  }

  static Widget passwordTextField({
    required TextEditingController passwordController,
    required FocusNode passwordNode,
    required void Function(String)? onChanged,
    required var obscureText,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: Obx(() {
        return TextFormField(
          onTapOutside: (value) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          onChanged: onChanged,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                '[ ]',
              ),
            ),
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          obscureText: obscureText.value,
          obscuringCharacter: '●',
          validator: (value) {
            if (value!.isEmpty) {
              return null;
            }
            if (value.length < 8) {
              return StringManager.passwordMinLength;
            }
            if (!value.contains(RegExp(r'[A-Z]'))) {
              return StringManager.passwordUppercase;
            }
            if (!value.contains(RegExp(r'[a-z]'))) {
              return StringManager.passwordLowercase;
            }
            if (!value.contains(RegExp(r'[0-9]'))) {
              return StringManager.passwordNumber;
            }
            if (!value.contains(RegExp(r'[!@#$%^&*()\-_=+{};:,<.>]'))) {
              return StringManager.passwordSymbol;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode: passwordNode,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: ColorManager.white,
            hintText: StringManager.userPassword,
            hintStyle: GoogleFonts.workSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.labelText,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.white,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(
                8.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.errorText,
              ),
              borderRadius: BorderRadius.circular(
                8.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.white,
              ),
              borderRadius: BorderRadius.circular(
                8.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.errorText,
              ),
              borderRadius: BorderRadius.circular(
                8.w,
              ),
            ),
            errorStyle: GoogleFonts.workSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.errorText,
            ),
            suffixIcon: InkWell(
              onTap: () {
                obscureText.value = !obscureText.value;
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 13.h,
                  left: 10.w,
                  right: 15.w,
                  bottom: 11.h,
                ),
                child: SvgPicture.asset(
                  obscureText.value
                      ? AssetManager.obscureClose
                      : AssetManager.obscureOpen,
                  width: 7.w,
                ),
              ),
            ),
          ),
          style: GoogleFonts.workSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.labelText,
          ),
          cursorColor: ColorManager.cursor,
        );
      }),
    );
  }

  static Widget primaryButton({
    required String? buttonName,
    required var isEnable,
    required void Function()? onTap,
  }) {
    var isPressed = false.obs;
    return Obx(
          () => GestureDetector(
        onTapDown: (value) {
          if (isEnable.value == true) {
            isPressed.value = true;
          }
        },
        onTapUp: (value) {
          if (isEnable.value == true) {
            isPressed.value = false;
          }
        },
        onTap: isEnable.value ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          margin: EdgeInsets.only(
            top: 35.h,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: isPressed.value
                ? ColorManager.buttonPressed
                : isEnable.value
                ? ColorManager.button
                : ColorManager.button.withOpacity(
              0.4,
            ),
            borderRadius: BorderRadius.circular(
              32.w,
            ),
            boxShadow: isEnable.value
                ? [
              BoxShadow(
                color: ColorManager.button.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
                : null,
          ),
          child: Text(
            buttonName!.toUpperCase(),
            style: GoogleFonts.workSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.white,
            ),
          ),
        ),
      ),
    );
  }

  static Widget guestLoginButton({
    required String? buttonName,
    required var isEnable,
    required void Function()? onTap,
  }) {
    var isPressed = false.obs;
    return Obx(
          () => GestureDetector(
        onTapDown: (value) {
          if (isEnable.value == true) {
            isPressed.value = true;
          }
        },
        onTapUp: (value) {
          if (isEnable.value == true) {
            isPressed.value = false;
          }
        },
        onTap: isEnable.value ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          margin: EdgeInsets.only(
            top: 8.h,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            color: isPressed.value
                ? ColorManager.white
                : isEnable.value
                ? ColorManager.white
                : ColorManager.white.withOpacity(
              0.4,
            ),
            border: Border.all(
                color: ColorManager.primary
            ),
            borderRadius: BorderRadius.circular(
              32.w,
            ),
            boxShadow: isEnable.value
                ? [
              BoxShadow(
                color: ColorManager.button.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
                : null,
          ),
          child: Text(
            buttonName!,
            style: GoogleFonts.workSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.primary,
            ),
          ),
        ),
      ),
    );
  }

  static Widget addToCart({
    required String? buttonName,
    required void Function()? onTap,
    Color ?color,
    Color ? labelColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
        ),
        margin: EdgeInsets.only(
          top: 4.h,
          bottom: 4.h,
        ),
        decoration: BoxDecoration(
            color:  color!,
            border: Border.all(
                color: ColorManager.white
            ),
            borderRadius: BorderRadius.circular(
              32.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.subTitleLightColor.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
        ),
        child: Text(
          buttonName!,
          style: GoogleFonts.workSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: labelColor,
          ),
        ),
      ),
    );
  }

  static Widget orderListButton({
    required String? buttonName,
    required void Function()? onTap,
    Color ?color,
    Color ? labelColor,
    Color ? borderColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 16.h,
        ),
        decoration: BoxDecoration(
            color:  color!,
            border: Border.all(color: borderColor!),
            borderRadius: BorderRadius.circular(
              32.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.subTitleLightColor.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonName!,
            style: GoogleFonts.workSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: labelColor,
            ),
          ),
        ),
      ),
    );
  }



  static Widget confirmPasswordTextField({
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required FocusNode confirmPasswordNode,
    required void Function(String)? onChanged,
    required var obscureText,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: Obx(() => TextFormField(
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onChanged: onChanged,
        controller: confirmPasswordController,
        keyboardType: TextInputType.visiblePassword,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp(
              '[ ]',
            ),
          ),
          FilteringTextInputFormatter.singleLineFormatter,
        ],
        obscureText: obscureText.value,
        obscuringCharacter: '●',
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          }
          if (passwordController.text != confirmPasswordController.text) {
            return StringManager.passwordMismatch;
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: confirmPasswordNode,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ColorManager.white,
          hintText: StringManager.conPassword,
          hintStyle: GoogleFonts.workSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.labelText,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.errorText,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.errorText,
            ),
            borderRadius: BorderRadius.circular(
              8.w,
            ),
          ),
          errorStyle: GoogleFonts.workSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.errorText,
          ),
          suffixIcon: InkWell(
            onTap: () {
              obscureText.value = !obscureText.value;
            },
            child: Container(
              padding: EdgeInsets.only(
                top: 13.h,
                left: 10.w,
                right: 15.w,
                bottom: 11.h,
              ),
              child: SvgPicture.asset(
                obscureText.value
                    ? AssetManager.obscureClose
                    : AssetManager.obscureOpen,
                width: 7.w,
              ),
            ),
          ),
        ),
        style: GoogleFonts.workSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.labelText,
        ),
        cursorColor: ColorManager.button,
      )),
    );
  }

  static void showCustomDialog() {
    Get.dialog(
      CustomDialogView(),
      barrierDismissible: false,
      barrierColor: ColorManager.button.withOpacity(
        0.5,
      ),
    );
  }

  static void hideCustomDialog() {
    Get.isDialogOpen! ? Get.back() : null;
  }

  static Widget titleWhiteCanvas({
    required String title,
    String? subtitle,
    required List<Widget> children,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp,
              color: ColorManager.displayText,
            ),
          ),
          subtitle == null
              ? const SizedBox()
              : Text(
            subtitle,
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: ColorManager.labelText,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.w,
              bottom: 10.w,
              left: 20.h,
              right: 20.h,
            ),
            margin: EdgeInsets.only(
              top: 15.h,
            ),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(
                10.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.boxShadow.withOpacity(
                    0.3,
                  ),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  static void showNumberPicker({
    required TextEditingController controller,
    required DropdownType type,
    required void Function(int)? onSelectedItemChanged,
  }) {
    int number;

    switch (type) {
      case DropdownType.adult:
        number = 20;
        break;
      case DropdownType.plane:
        number = 101;
        break;
      case DropdownType.car:
        number = 6;
        break;
    }

    showCupertinoModalPopup(
      filter: ImageFilter.blur(
        sigmaY: 3,
        sigmaX: 3,
      ),
      barrierColor: ColorManager.button.withOpacity(
        0.5,
      ),
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          height: 180.h,
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
          ),
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 40.sp,
            scrollController: FixedExtentScrollController(
              initialItem: type == DropdownType.adult
                  ? int.tryParse(controller.text)! - 1
                  : int.tryParse(controller.text)!,
            ),
            onSelectedItemChanged: onSelectedItemChanged,
            children: List<Widget>.generate(
              number,
                  (int index) {
                return Center(
                  child: Text(
                    type == DropdownType.adult ? '${index + 1}' : '$index',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 22.sp,
                      color: ColorManager.labelText,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  static Widget whiteCanvas({
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10.w,
            bottom: 10.w,
            left: 10.h,
            right: 10.h,
          ),
          margin: EdgeInsets.only(
            top: 15.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(
              10.w,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.boxShadow.withOpacity(
                  0.3,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  static Widget customButton({
    required String buttonName,
    required var isEnable,
    required ButtonType type,
    required void Function()? onTap,
  }) {
    Color buttonColor;
    Color pressedColor;
    Color textColor;
    double textSize;
    FontWeight textWeight;

    switch (type) {
      case ButtonType.primary:
        buttonColor = ColorManager.spalshButtonColor;
        pressedColor = ColorManager.primaryButtonPressed;
        textColor = ColorManager.primary;
        textSize = 16.sp;
        textWeight = FontWeight.w500;
      case ButtonType.secondary:
        buttonColor = ColorManager.primary;
        pressedColor = ColorManager.primaryButtonPressed;
        textColor = ColorManager.white;
        textSize = 14.sp;
        textWeight = FontWeight.w600;
      case ButtonType.tertiary:
        buttonColor = ColorManager.primary.withOpacity(
          0.3,
        );
        pressedColor = ColorManager.primaryButtonPressed.withOpacity(
          0.3,
        );
        textColor = ColorManager.primary;
        textSize = 14.sp;
        textWeight = FontWeight.w600;
      case ButtonType.extra:
        buttonColor = ColorManager.primary.withOpacity(
          0.3,
        );
        pressedColor = ColorManager.primaryButtonPressed.withOpacity(
          0.3,
        );
        textColor = ColorManager.primary;
        textSize = 20.sp;
        textWeight = FontWeight.w800;
    }
    var isPressed = false.obs;
    return Obx(
          () => GestureDetector(
        onTapDown: (value) {
          if (isEnable.value == true) {
            isPressed.value = true;
          }
        },
        onTapUp: (value) {
          if (isEnable.value == true) {
            isPressed.value = false;
          }
        },
        onTap: isEnable.value ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: type == ButtonType.primary ? 10.h : 8.h,
          ),
          margin: type == ButtonType.primary
              ? EdgeInsets.only(
            top: buttonName == StringManager.submit
                ? 50.h
                : type == ButtonType.extra
                ? 0
                : 35.h,
            bottom: 20.h,
          )
              : null,
          decoration: BoxDecoration(
            color: isPressed.value
                ? pressedColor
                : isEnable.value
                ? buttonColor
                : buttonColor.withOpacity(
              0.4,
            ),
            borderRadius: BorderRadius.circular(
              ScreenUtil().screenWidth,
            ),
            boxShadow: type == ButtonType.primary
                ? isEnable.value
                ? [
              BoxShadow(
                color: buttonColor.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
                : null
                : null,
          ),
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  static Widget customBlackButton({
    required String buttonName,
    required var isEnable,
    required ButtonType type,
    required void Function()? onTap,
  }) {
    Color buttonColor;
    Color pressedColor;
    Color textColor;
    double textSize;
    FontWeight textWeight;

    switch (type) {
      case ButtonType.primary:
        buttonColor = ColorManager.black;
        pressedColor = ColorManager.primaryButtonPressed;
        textColor = ColorManager.white;
        textSize = 16.sp;
        textWeight = FontWeight.w500;
      case ButtonType.secondary:
        buttonColor = ColorManager.primary;
        pressedColor = ColorManager.primaryButtonPressed;
        textColor = ColorManager.white;
        textSize = 14.sp;
        textWeight = FontWeight.w600;
      case ButtonType.tertiary:
        buttonColor = ColorManager.primary.withOpacity(
          0.3,
        );
        pressedColor = ColorManager.primaryButtonPressed.withOpacity(
          0.3,
        );
        textColor = ColorManager.primary;
        textSize = 14.sp;
        textWeight = FontWeight.w600;
      case ButtonType.extra:
        buttonColor = ColorManager.primary.withOpacity(
          0.3,
        );
        pressedColor = ColorManager.primaryButtonPressed.withOpacity(
          0.3,
        );
        textColor = ColorManager.primary;
        textSize = 20.sp;
        textWeight = FontWeight.w800;
    }
    var isPressed = false.obs;
    return Obx(
          () => GestureDetector(
        onTapDown: (value) {
          if (isEnable.value == true) {
            isPressed.value = true;
          }
        },
        onTapUp: (value) {
          if (isEnable.value == true) {
            isPressed.value = false;
          }
        },
        onTap: isEnable.value ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: type == ButtonType.primary ? 10.h : 8.h,
          ),
          margin: type == ButtonType.primary
              ? EdgeInsets.only(
            top: buttonName == StringManager.submit
                ? 50.h
                : type == ButtonType.extra
                ? 0
                : 35.h,
            bottom: 20.h,
          )
              : null,
          decoration: BoxDecoration(
            color: isPressed.value
                ? pressedColor
                : isEnable.value
                ? buttonColor
                : buttonColor.withOpacity(
              0.4,
            ),
            borderRadius: BorderRadius.circular(
              ScreenUtil().screenWidth,
            ),
            boxShadow: type == ButtonType.primary
                ? isEnable.value
                ? [
              BoxShadow(
                color: buttonColor.withOpacity(
                  0.5,
                ),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]
                : null
                : null,
          ),
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

}

enum ButtonType {
  primary,
  secondary,
  tertiary,
  extra,
}

enum SnackBarType {
  success,
  info,
  error,
  notification,
}

enum AppBarType {
  primary,
  secondary,
  home,
  offset,
  tip,
  notification,
}

enum DropdownType {
  adult,
  plane,
  car,
}

enum DataType {
  home,
  mobility,
  gear,
  others,
  public,
}
