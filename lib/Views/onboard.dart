import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:poloniex_app/Views/login.dart';
import 'package:poloniex_app/Views/signup.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff437D28),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Column(
          children: [
            Icon(
              Icons.map_sharp,
              color: Colors.white,
              size: 80,
            ),
            Text(
              "Poloniex App",
              style: TextStyle(
                color: Color(0xFFF2FEEC),
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Text(
          "Kindness to Nature, Kindness to You Our Vegan Beauty Promise",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFF2FEED),
            fontSize: 18,
            fontWeight: FontWeight.w100,
            letterSpacing: 0.48,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(const LoginScreen());
                },
                child: Container(
                  width: 156,
                  height: 56,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFF2FEED)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Color(0xFFF2FEED),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )),
            TextButton(
                onPressed: () {
                  Get.to(const SingupScreen());
                },
                child: Container(
                  width: 156,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF2FEED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Color(0xFF437C28),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )),
          ],
        )
      ]),
    );
  }
}
