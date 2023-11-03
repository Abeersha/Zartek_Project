import 'package:flutter/material.dart';
import 'package:zartek_project/constants/imageandcolor.dart';
import 'package:zartek_project/Sevices/fire_functions.dart';
import 'package:zartek_project/view/widget/loginbutton.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 450,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(firebaselogo))),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LoginButton(
            buttonText: 'Google',
            iconImage: googleimagelogo,
            onPressed: () {
              FirebaseService.signInwithGoogle(
                  context); // Add the Google sign-in logic here
            },
          ),
          const SizedBox(height: 15),
          LoginButton(
            buttonText: 'Phone',
            iconImage: phonelogo,
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 50, 202, 55),
            iconColor: Colors.green,
          ),
       
        ],
      ),
    );
  }
}
