#!/bin/bash

echo "⚙️  Auto-fixing LoginScreen..."

cat <<EOF > lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                bool success = await authProvider.login(
                  _emailController.text,
                  _passwordController.text,
                );
                if (success) {
                  Navigator.pushReplacementNamed(
                    context,
                    '/\${authProvider.currentUser?['role'] ?? 'unknown'}/dashboard',
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login gagal')),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
EOF

echo "✅ LoginScreen fixed successfully."

echo "⚙️  Upgrading Flutter packages to fix file_picker & plugin issues..."
flutter pub upgrade --major-versions
echo "✅ Packages upgraded. Please test your app."
