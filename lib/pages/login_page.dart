import 'package:flutter/material.dart';
import 'package:slam/pages/forgot_password.dart';
// import 'package:slam/widgets/custom_elevated_button.dart';

import '../widgets/blue_background.dart';
import '../widgets/custom_textfield.dart';
import 'welcome_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.0127),
                const Text(
                  'Kindly enter your details to login',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                // SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'to enjoy seamless ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: 'Bus Tracking ',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'for easy mobility,\nand a ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: 'Panic Emergency',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w100)),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.0341),
                const CustomTextField(
                  hintText: 'Enter your email here',
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 12),
                const CustomTextField(
                  hintText: 'Enter your password here',
                  isPassword: true,
                  prefixIcon: Icons.lock_open_outlined,
                ),
                SizedBox(height: size.height * 0.0227),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ),

                // TextButton(
                //   onPressed: () {
                //     // TO-DO
                //     // Navigate to Forgot Password page
                //   },
                //   child: const Text(
                //     'Forgot Password',
                //     style: TextStyle(color: Colors.orange, fontSize: 14),
                //   ),
                // ),
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
                      // print('Login button pressed');
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

                // CustomElevatedButton(
                //   onPressed: () {
                //     print('Login button pressed');
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const WelcomePage()),
                //     );
                //   },
                //   label: 'Login',
                //   backgroundColor: Colors.orange,
                // ),
              ]),
        ),
      ),
    );
  }
}
