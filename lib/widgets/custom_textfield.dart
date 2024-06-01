import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final IconData prefixIcon;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.isPassword,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextField(
        obscuringCharacter: '*',
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
