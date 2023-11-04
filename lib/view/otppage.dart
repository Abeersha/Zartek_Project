import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zartek_project/controller/phoneauthcontroller.dart';

// ignore: must_be_immutable
class OTPVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  TextEditingController otpNumberController = TextEditingController();

  OTPVerificationScreen(
      {super.key, required this.phoneNumber, required this.verificationId});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onVerifyPressed() {
    if (_formKey.currentState!.validate()) {
      String otp = otpNumberController.text;

      Get.find<AuthController>().codeVerify(otp, verificationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter the OTP sent to $phoneNumber:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
                controller: otpNumberController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid OTP';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onVerifyPressed,
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
