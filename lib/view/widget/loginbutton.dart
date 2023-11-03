import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final String iconImage;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const LoginButton({super.key, 
    required this.buttonText,
    required this.iconImage,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const SizedBox(width: 3),
            CircleAvatar(
              backgroundColor: iconColor,
              radius: 20,
              child: ClipOval(
                child: Image.asset(iconImage, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 40),
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
