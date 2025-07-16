import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginScreen({super.key, required this.onLogin});

  Future<void> _signInGoogle() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signIn();
    onLogin();
  }

  Future<void> _signInFacebook() async {
    await FacebookAuth.instance.login();
    onLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onLogin,
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _signInGoogle,
              child: const Text('Sign In with Google'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _signInFacebook,
              child: const Text('Sign In with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
