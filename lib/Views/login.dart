import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:poloniex_app/Views/home.dart';
import 'package:poloniex_app/Views/signup.dart';
import 'package:poloniex_app/controllers/login_controller.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginCont = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Row(children: [
            Icon(
              Icons.chevron_left,
              color: Color(0xFF437C28),
              size: 34,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Color(0xFF437C28),
              ),
            )
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(children: [
              const Text(
                'Welcome back!',
                style: TextStyle(
                  color: Color(0xFF437C28),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                hintText: 'Enter your Email',
                labelText: 'Email Address',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hintText: 'Enter your email',
                  labelText: 'Password',
                  obscureText: loginCont.obscureText.value,
                  suffixIcon: IconButton(
                      onPressed: () {
                        loginCont.obscureText.value =
                            !loginCont.obscureText.value;
                      },
                      icon: Icon(
                        loginCont.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: loginCont.obscureText.value
                            ? Color(0xFF437C28)
                            : Colors.grey,
                      ))),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                height: 50,
                buttonText: 'Login',
                borderColor: Colors.transparent,
                onTap: () {
                  Get.to(HomeScreen());
                },
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xFF437C28),
                            fontWeight: FontWeight.w500),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
