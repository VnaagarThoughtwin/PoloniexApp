import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? suffixIcon;
  bool? obscureText;
   CustomTextFormField({
    super.key,
     this.labelText,
     this.hintText,
     this.suffixIcon,
     this.obscureText,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText??"",
        labelStyle: TextStyle(color: Color(0xFF437C28),),
        hintText: hintText??"",
        hintStyle: TextStyle(color: Colors.grey[400],),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF437C28),),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF437C28),),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF437C28),),
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}