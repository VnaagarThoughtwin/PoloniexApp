import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:poloniex_app/Views/login.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textField.dart';
import '../controllers/login_controller.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final LoginController loginCont = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Get Started!',
                style: TextStyle(
                  color: Color(0xFF437C28),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                hintText: 'Enter your First Name',
                labelText: 'First Name',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Enter your Last Name',
                labelText: 'Last Name',
              ),
              SizedBox(
                height: 20,
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
                buttonText: 'Sign Up',
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
                    "If you have account?",
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: const Text(
                        'Login',
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
