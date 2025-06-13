import 'package:get/get.dart';
import 'package:registration_page/Bindings/LoginBinding.dart';
import 'package:registration_page/Bindings/RegistrationBinding.dart';
import 'package:registration_page/Routes/AppRoute.dart';
import 'package:registration_page/Views/Login.dart';
import 'package:registration_page/Views/Registration.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoute.register,
      page: () => Registration(),
      binding: RegistrationBinding(),
    ),
    GetPage(name: AppRoute.login, page: () => Login(), binding: LoginBinding()),
  ];
}
