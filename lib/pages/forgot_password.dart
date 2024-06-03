import 'package:flutter/material.dart';

import 'package:slam/widgets/custom_elevated_button.dart';
import 'package:slam/widgets/grey_background.dart';

import '../widgets/custom_textfield.dart';
import 'terms_and_conditions_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isChecked = false;
  bool emptyController = true;
  bool isClearToSubmit = false;
  final TextEditingController forgotPassController = TextEditingController();

  // void _showCheckboxMessage(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Please check the terms and conditions checkbox first.'),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    forgotPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return greyBackgroundImage(
      mainWidget: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.239,
                    width: size.width * 0.659,
                    child: Image.asset(
                      'assets/images/forgot password.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.0127),
                const Text(
                  'Don\'t worry! It occurs. Please enter the email address linked to your account.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(height: size.height * 0.0341),
                CustomTextField(
                  onChanged: (txt) {
                    if (_isChecked & txt.isNotEmpty) {
                      setState(() {
                        isClearToSubmit = true;
                      });
                    }
                    if (_isChecked & txt.isEmpty) {
                      setState(() {
                        isClearToSubmit = false;
                      });
                    }
                    if (txt.isNotEmpty) {
                      setState(() {
                        emptyController = false;
                      });
                    }
                    if (txt.isEmpty) {
                      setState(() {
                        emptyController = true;
                      });
                    }
                  },
                  controller: forgotPassController,
                  hintText: 'Enter your email',
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: size.height * 0.0227),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        activeColor: Colors.orange,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                          if (!emptyController & _isChecked) {
                            setState(() {
                              isClearToSubmit = true;
                            });
                          }
                          if (!emptyController & !_isChecked) {
                            setState(() {
                              isClearToSubmit = false;
                            });
                          }
                        }),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsAndConditions()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'I agree to the  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'terms and conditions. ',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     print("Terms and conditions tapped!");
                          //     // Navigate to terms and conditions page

                          //   },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.0341),
                CustomElevatedButton(
                  onPressed: isClearToSubmit
                      ? () {
                          debugPrint(forgotPassController.text);
                        }
                      : () {},
                  //  _isChecked
                  //     ? () {}
                  //     : () {
                  //         _showCheckboxMessage(context);
                  //       },
                  backgroundColor:
                      isClearToSubmit ? Colors.orange : Colors.grey.shade300,
                  label: 'Verify Email',
                ),
                SizedBox(height: size.height * 0.017),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
