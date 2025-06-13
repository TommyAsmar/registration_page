import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:registration_page/Core/Network/DioClient.dart';
import 'package:registration_page/Models/User.dart';

class RegistrationController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController password = TextEditingController();

  void register() {
    User user = User(
      name: name.text,
      email: email.text,
      mobile: mobile.text,
      country: country.text,
      password: password.text,
    );

    String requestBody = user.toJson();

    var post = DioClient().getInstance().post('/register', data: requestBody);

    post
        .then((response) {
          if (response.statusCode == 200) {
            print("Registration successful: ${response.data}");
            Get.snackbar("Success", "Registration successful");
          } else {
            print("Registration failed: ${response.data}");
            Get.snackbar("Error", "Registration failed");
          }
        })
        .catchError((error) {
          print("Error: $error");
          Get.snackbar("Error", "An error occurred during registration");
        });
  }
}
