import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_project/Sevices/fire_functions.dart';
import 'package:zartek_project/view/homescreen.dart';
import 'package:zartek_project/view/otppage.dart'; // Make sure to import Get

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  Future<void> phoneAuth(String phoneNumber) async {
    try {
      verificationCompleted(PhoneAuthCredential credential) {
        Get.defaultDialog(title: "Authenticated");
      }

      verificationFailed(FirebaseAuthException exception) {}

      codeSent(String verificationId, int? forceResendingToken) {
        Get.to(OTPVerificationScreen(
          phoneNumber: phoneNumber,
          verificationId: verificationId,
        ));
      }

      codeAutoRetrievalTimeout(String verificationId) {}

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> codeVerify(String otp, String verificationId) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    try {
      userCredential = await auth.signInWithCredential(credential);

      Get.offAll(Homescreen(userCredential!));
    } catch (e) {
      Get.defaultDialog(title: "Incorrect PIN");
    }
  }
}
