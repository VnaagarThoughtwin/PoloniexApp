import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:poloniex_app/Views/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 80,
        leading: Row(children: [
          Icon(
            Icons.chevron_left,
            color: Theme.of(context).primaryColor,
            size: 34,
          ),
          Text(
            "Back",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          )
        ]),
      ),
      body: Wrap(
        runSpacing: 30,
        children: [
        const Text(
          'Welcome back!',
          style: TextStyle(
            color: Color(0xFF437C28),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.to( HomeScreen());
            },
            child: Container(
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFF437C28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFFF2FEED),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
