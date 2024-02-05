import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:poloniex_app/Views/home.dart';
import 'package:poloniex_app/Views/login.dart';
import 'package:poloniex_app/controllers/auth_controllers.dart';
import 'package:poloniex_app/controllers/homeController.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textField.dart';
import '../controllers/login_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final LoginController loginCont = Get.put(LoginController());

  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

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
                controller: authController.firstNameController,
                hintText: 'Enter your First Name',
                labelText: 'First Name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: authController.lastNameController,
                hintText: 'Enter your Last Name',
                labelText: 'Last Name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Enter your Email',
                labelText: 'Email Address',
              ),
              const SizedBox(
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
                            ? const Color(0xFF437C28)
                            : Colors.grey,
                      ))),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                height: 50,
                buttonText: 'Sign Up',
                borderColor: Colors.transparent,
                onTap: () {
                  Get.to(HomeScreen());
                  Future<UserCredential> result = authController.signUp(
                      emailController.text, passwordController.text);
                  // ignore: unnecessary_null_comparison
                  if (result != null) {
                    print('Sign Up Successful: ${result}');
                  } else {
                    Fluttertoast.showToast(
                        msg: "signIu Failed Please check Credentials ");
                  }
                },
              ),
              const SizedBox(
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
