// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:zartek_project/controller/phoneauthcontroller.dart';

class PhoneNumberInputScreen extends StatefulWidget {
  const PhoneNumberInputScreen({super.key});

  @override
  _PhoneNumberInputScreenState createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  void _onVerifyPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = phoneNumberController.text;

      AuthController().phoneAuth(phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Phone Number Verification')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter your phone number with code:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                controller:
                    phoneNumberController, // Use a controller to capture input
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final phoneNumber = value?.trim();
                  if (phoneNumber == null ||
                      phoneNumber.isEmpty ||
                      !phoneNumber.startsWith('+91')) {
                    return 'Please enter a valid phone number with the +91 prefix.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _onVerifyPressed(context);
                },
                child: const Text('Verify Phone Number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
