import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to capture user input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUserIn() {
    // TODO: Implement your Firebase/Backend Auth logic here
    print("Email: ${_emailController.text}");
    print("Password: ${_passwordController.text}");
  }

  void signUserInWithGoogle() {
    // TODO: Implement Google Sign-In logic
    print("Google Sign In Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // 1. Logo or Icon
                  const Icon(
                    Icons.lock_person_rounded,
                    size: 100,
                    color: Colors.deepPurple,
                  ),

                  const SizedBox(height: 30),

                  // 2. Welcome Text
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please sign in to continue',
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),

                  const SizedBox(height: 50),

                  // 3. Email Textfield
                  MyTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false,
                    icon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 15),

                  // 4. Password Textfield
                  MyTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icon: Icons.lock_outline,
                  ),

                  const SizedBox(height: 10),

                  // 5. Forgot Password?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // 6. Login Button
                  MyButton(text: "Sign In", onTap: signUserIn),

                  const SizedBox(height: 40),

                  // 7. Divider: "Or continue with"
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // 8. Google Sign In Button
                  GestureDetector(
                    onTap: signUserInWithGoogle,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.google, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 9. Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Register Page
                          print("Register Tapped");
                        },
                        child: ElevatedButton.icon(
                          onPressed: () => {
                            
                          },
                          label: const Text("Register"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- CUSTOM WIDGETS FOR CLEANER CODE ---

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.shade200,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
