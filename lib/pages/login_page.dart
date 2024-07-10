import 'package:flutter/material.dart';
// import 'package:slam/pages/admin_dashboard.dart';
import 'package:slam/pages/forgot_password.dart';

import '../widgets/blue_background.dart';
import '../widgets/custom_textfield.dart';
import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return blueBackgroundImage(
      mainWidget: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.0127),
                const Text(
                  'Kindly enter your details to login',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                // SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'to enjoy seamless ',
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: 'Bus Tracking ',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'for easy mobility,\nand a ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: 'Panic Emergency',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: '.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.0341),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email ',
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  isPassword: true,
                  prefixIcon: Icons.lock_open_outlined,
                ),
                SizedBox(height: size.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.orange, fontSize: 18),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.0341),

                SizedBox(
                  height: size.height * 0.0682,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
