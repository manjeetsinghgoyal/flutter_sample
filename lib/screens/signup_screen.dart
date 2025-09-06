import 'package:flutter/material.dart';
import '../routes.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    // Full Name Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Full name is required";
                        }
                        if (value.length < 3) {
                          return "Name must be at least 3 characters long";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    // Email Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
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
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                    SizedBox(height: 20),

                    // Create Account Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Create Account"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ✅ All fields valid → go home
                          Navigator.pushReplacementNamed(context, Routes.home);
                        }
                      },
                    ),
                    SizedBox(height: 10),

                    // Already have an account
                    TextButton(
                      child: Text("Already have an account? Login"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
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
