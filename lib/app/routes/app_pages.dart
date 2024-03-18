import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth/reset_password/views/reset_password_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/auth/splash_page/bindings/splash_page_binding.dart';
import '../modules/auth/splash_page/views/splash_page_view.dart';
import '../modules/auth/verify_otp/bindings/verify_otp_binding.dart';
import '../modules/auth/verify_otp/views/verify_otp_view.dart';
import '../modules/main_module/cart/bindings/cart_binding.dart';
import '../modules/main_module/cart/views/cart_view.dart';
import '../modules/main_module/cart_page/bindings/cart_page_binding.dart';
import '../modules/main_module/cart_page/bindings/cart_page_binding.dart';
import '../modules/main_module/cart_page/views/cart_page_view.dart';
import '../modules/main_module/cart_page/views/cart_page_view.dart';
import '../modules/main_module/favourite/bindings/favourite_binding.dart';
import '../modules/main_module/favourite/views/favourite_view.dart';
import '../modules/main_module/home/bindings/home_binding.dart';
import '../modules/main_module/home/views/home_view.dart';
import '../modules/main_module/navigation_bar/bindings/navigation_bar_binding.dart';
import '../modules/main_module/navigation_bar/views/navigation_bar_view.dart';
import '../modules/main_module/profile/bindings/profile_binding.dart';
import '../modules/main_module/profile/views/profile_view.dart';
import '../modules/main_module/search_page/bindings/search_page_binding.dart';
import '../modules/main_module/search_page/views/search_page_view.dart';
import '../modules/main_module/upcoming/bindings/upcoming_binding.dart';
import '../modules/main_module/upcoming/views/upcoming_view.dart';
import '../modules/main_module/user_cart/bindings/user_cart_binding.dart';
import '../modules/main_module/user_cart/views/user_cart_view.dart';
import '../modules/misc/abc/bindings/abc_binding.dart';
import '../modules/misc/abc/views/abc_view.dart';
import '../modules/misc/notification/bindings/notification_binding.dart';
import '../modules/misc/notification/views/notification_view.dart';
import '../modules/misc/support/bindings/support_binding.dart';
import '../modules/misc/support/views/support_view.dart';
import '../modules/viewCart/bindings/view_cart_binding.dart';
import '../modules/viewCart/views/view_cart_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => const FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING,
      page: () => const UpcomingView(),
      binding: UpcomingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
      children: [
        GetPage(
          name: _Paths.CART_PAGE,
          page: () => const CartPageView(),
          binding: CartPageBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.VIEW_CART,
      page: () => const ViewCartView(),
      binding: ViewCartBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ABC,
      page: () => const AbcView(),
      binding: AbcBinding(),
    ),
    GetPage(
      name: _Paths.USER_CART,
      page: () => const UserCartView(),
      binding: UserCartBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
  ];
}
