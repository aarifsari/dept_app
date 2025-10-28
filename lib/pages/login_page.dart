import 'package:flutter/material.dart';
import '../routes.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _u = TextEditingController();
  final _p = TextEditingController();
  bool _busy = false;
  final _auth = AuthService();

  static const _brand = Color(0xFF2E6AA7);

  InputDecoration _input(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  );

  Future<void> _showMsg(String title, String msg, {VoidCallback? onOk}) async {
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(msg, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onOk?.call();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _brand,
        foregroundColor: Colors.white,
        title: const Text('Department Application'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                TextField(controller: _u, decoration: _input('Username')),
                const SizedBox(height: 12),
                TextField(
                  controller: _p,
                  decoration: _input('Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: _brand,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _busy
                        ? null
                        : () async {
                            setState(() => _busy = true);
                            final ok = await _auth.login(
                              _u.text.trim(),
                              _p.text,
                            );
                            setState(() => _busy = false);

                            if (!mounted) return;
                            if (ok) {
                              await _showMsg(
                                'Log In Successful!',
                                'You will be redirected to\n the Main Page!',
                                onOk: () => Navigator.pushReplacementNamed(
                                  context,
                                  Routes.instructors,
                                ),
                              );
                            } else {
                              await _showMsg(
                                'Log In Failed!',
                                'Please try again!',
                              );
                            }
                          },
                    child: _busy
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Log In'),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('or'),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.signup),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
