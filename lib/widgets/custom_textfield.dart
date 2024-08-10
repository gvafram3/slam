import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final void Function(String txt)? onChanged;

  const CustomTextField({
    super.key,
    required this.isPassword,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscuringCharacter: '*',
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange.shade200, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
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
          ),
        ),
      ),
    );
  }
}




//import 'package:flutter/material.dart';

// class CustomTextField extends StatefulWidget {
//   final bool isPassword;
//   final IconData prefixIcon;
//   final String hintText;
//   final TextEditingController controller;
//   final void Function(String txt)? onChanged;

//   const CustomTextField({
//     super.key,
//     required this.isPassword,
//     required this.prefixIcon,
//     required this.hintText,
//     required this.controller,
//     this.onChanged,
//   });

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     // final size = MediaQuery.of(context).size;

//     return SizedBox(
//       height: 55,
//       width: double.infinity,
//       child: TextField(
//         onChanged: widget.onChanged,
//         obscuringCharacter: '*',
//         obscureText: widget.isPassword ? _obscureText : false,
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 10.0,
//               vertical: 15.0,
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.orange, width: 2.0),
//             ),
//             filled: true,
//             fillColor: Colors.grey[200],
//             prefixIcon: Icon(widget.prefixIcon),
//             suffixIcon: widget.isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   )
//                 : null,
//             hintText: widget.hintText,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15.0),
//               borderSide: BorderSide.none,
//             )),
//       ),
//     );
//   }
// }
