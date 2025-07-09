import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:massapp/providers/auth_provider.dart';
import 'package:massapp/widgets/custom_button.dart';
import 'package:massapp/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _fullNameController,
              label: 'Full Name',
            ),
            CustomTextField(
              controller: _idController,
              label: 'NIM/NIDN',
            ),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 16),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return CustomButton(
                  text: 'Register',
                  onPressed: authProvider.isLoading
                      ? null
                      : () async {
                          final userData = {
                            'fullName': _fullNameController.text,
                            'nimNidn': _idController.text,
                            'email': _emailController.text,
                            'password': _passwordController.text,
                          };
                          final success = await authProvider.register(userData);
                          if (success) {
                            Navigator.pop(context);
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
