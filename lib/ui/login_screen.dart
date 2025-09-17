import 'package:flutter/material.dart';
import '../data/api/product_service.dart';
import 'product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  bool _loading = false;

  Future<void> login() async {
    setState(() => _loading = true);
    try {
      final svc = ProductService(null);
      final user = await svc.apiClient.login({
        'username': _controller.text,
        'password': '1234'
      });
      final token = user.token;
      // go to product screen (useHive true by default)
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProductScreen(token: token, useHive: true)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: \$e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loading ? null : login, child: _loading ? const CircularProgressIndicator() : const Text('Login'))
          ],
        ),
      ),
    );
  }
}
