import 'package:flutter/material.dart';
import '../routes.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Login",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w100)),
                    SizedBox(height: 20),

                    // Email Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        // Simple email regex
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    // Password Field
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),

                    // Login Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      child: Text("Login"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid → proceed
                          Navigator.pushReplacementNamed(context, Routes.home);
                        }
                      },
                    ),
                    SizedBox(height: 10),

                    // Signup Button
                    TextButton(
                      child: Text("Don't have an account? Sign Up"),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signup);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
