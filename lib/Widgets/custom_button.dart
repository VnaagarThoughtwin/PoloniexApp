import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onTap;
  String? buttonText;
  double? height;
  double? width;
  Color borderColor;
  CustomButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.height,
    this.width,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor),
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color(0xFF437C28),
        ),
        child: Center(
          child: Text(
            buttonText ?? "",
            style: const TextStyle(
              color: Color(0xFFF2FEED),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
