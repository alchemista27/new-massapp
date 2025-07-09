#!/bin/bash

# === Auto Fix Login Screen ===
LOGIN_SCREEN="lib/screens/auth/login_screen.dart"

if [ -f "$LOGIN_SCREEN" ]; then
  cp "$LOGIN_SCREEN" "${LOGIN_SCREEN}.bak"
  cat > "$LOGIN_SCREEN" << 'EOF'
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    '/${authProvider.currentUser?['role'] ?? 'unknown'}/dashboard',
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed')),
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
  echo "✅ LoginScreen has been fully auto-fixed successfully!"
else
  echo "❌ LoginScreen not found at $LOGIN_SCREEN"
fi

# === Auto Fix file_picker plugin warning ===
LOCKFILE="pubspec.lock"
if [ -f "$LOCKFILE" ]; then
  cp "$LOCKFILE" "${LOCKFILE}.bak"
  sed -i '/file_picker:/,/^[^ ]/ s/^\([[:space:]]*default_package:\).*//' "$LOCKFILE"
  echo "✅ pubspec.lock plugin default_package removed for file_picker (Linux, macOS, Windows)"
else
  echo "❌ pubspec.lock not found. Run 'flutter pub get' first."
fi

echo ""
echo "🚀 ALL AUTO FIX DONE!"
echo "Next Step: Run 'flutter pub get' then 'flutter build apk' again."
