import 'package:get/get.dart';
import 'package:registration_page/Controllers/RegistrationController.dart';
import 'package:flutter/material.dart';

class Registration extends GetView<RegistrationController> {
  final _formKey = GlobalKey<FormState>();
  final RxBool _obscurePassword = true.obs;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();

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
              _buildField(_nameController, "Full Name", Icons.person),
              const SizedBox(height: 16),
              _buildField(
                _emailController,
                "Email",
                Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildField(
                _phoneController,
                "Phone Number",
                Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              _buildField(_countryController, "Country", Icons.public),
              const SizedBox(height: 16),
              _buildPasswordField(),
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
                    if (_formKey.currentState!.validate()) {
                      // Handle submission
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator:
          (value) =>
              (value == null || value.isEmpty)
                  ? "Please enter your $label"
                  : null,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () => TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword.value,
        validator:
            (value) =>
                (value == null || value.length < 6)
                    ? "Password must be at least 6 characters"
                    : null,
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword.value ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => _obscurePassword.value = !_obscurePassword.value,
          ),
        ),
      ),
    );
  }
}
