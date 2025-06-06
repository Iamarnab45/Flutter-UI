import 'package:flutter/material.dart';
import 'login_form.dart';
import 'register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;

  // Single method that handles both cases
  void _switchTab() => setState(() => _isLogin = !_isLogin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tabs
                Row(
                  children: [
                    _buildTab('Login', _isLogin),
                    _buildTab('Sign Up', !_isLogin),
                  ],
                ),
                const SizedBox(height: 32),
                // Forms
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child:
                        _isLogin
                            ? LoginForm(onSwitchToSignUp: _switchTab)
                            : Column(
                              children: [
                                RegisterForm(onSwitchTab: _switchTab),
                                const SizedBox(height: 16),
                                TextButton(
                                  onPressed: _switchTab,
                                  child: const Text.rich(
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      children: [
                                        TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return Expanded(
      child: InkWell(
        onTap: isActive ? null : _switchTab,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              color: isActive ? Colors.blue : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
