import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
            CleanerTextfield(
              prefix: Icon(
                Icons.email,
                size: 15,
              ),
              hintlabel: 'Enter your email',
            ),
            CleanerTextfield(
                prefix: Icon(
                  Icons.password,
                  size: 15,
                ),
                hintlabel: 'Enter your password'),
            CleanerButton.elevated(label: 'login', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
