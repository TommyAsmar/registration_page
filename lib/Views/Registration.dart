import 'package:get/get.dart';
import 'package:registration_page/Controllers/RegistrationController.dart';
import 'package:flutter/material.dart';

class Registration extends GetView<RegistrationController> {
  final _formKey = GlobalKey<FormState>();
  final RxBool _obscurePassword = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: controller.name,
                label: "Full Name",
                hint: "Enter your full name",
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: controller.email,
                label: "Email",
                hint: "Enter your email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: controller.mobile,
                label: "Phone Number",
                hint: "Enter your phone number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: controller.country,
                label: "Country",
                hint: "Enter your country",
                icon: Icons.public,
              ),
              const SizedBox(height: 16),
              Obx(
                () => buildTextField(
                  controller: controller.password,
                  label: "Password",
                  hint: "Enter your password",
                  icon: Icons.lock,
                  obscureText: _obscurePassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed:
                        () => _obscurePassword.value = !_obscurePassword.value,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.app_registration),
                  label: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    controller.register();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your $label";
        }
        if (label == "Password" && value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
