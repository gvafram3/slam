import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController referenceNumberController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bYearController = TextEditingController();
  final TextEditingController bMonthController = TextEditingController();
  final TextEditingController bDayController = TextEditingController();
  final TextEditingController shsAttendedController = TextEditingController();

  File? _photoFile;
  File? _birthCertFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(String type) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        if (type == 'photo') {
          _photoFile = File(pickedFile.path);
        } else if (type == 'birthCert') {
          _birthCertFile = File(pickedFile.path);
        }
      }
    });
  }

  // Method to send data to the backend
  Future<void> submitData() async {
    if (_formKey.currentState!.validate()) {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your-backend-url.com/api/register'),
      );

      request.fields['name'] = nameController.text;
      request.fields['email'] = emailController.text;
      request.fields['username'] = usernameController.text;
      request.fields['password'] = passwordController.text;
      request.fields['phoneNumber'] = phoneNumberController.text;
      request.fields['referenceNumber'] = referenceNumberController.text;
      request.fields['gender'] = genderController.text;
      request.fields['bYear'] = bYearController.text;
      request.fields['bMonth'] = bMonthController.text;
      request.fields['bDay'] = bDayController.text;
      request.fields['shsAttended'] = shsAttendedController.text;

      if (_photoFile != null) {
        request.files
            .add(await http.MultipartFile.fromPath('photo', _photoFile!.path));
      }
      if (_birthCertFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'birthCert', _birthCertFile!.path));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration successful!'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration failed. Please try again.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 50),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^\d{10,15}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: referenceNumberController,
                  decoration:
                      const InputDecoration(labelText: 'Reference Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a reference number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: genderController,
                  decoration:
                      const InputDecoration(labelText: 'Gender (Male/Female)'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        (value != 'Male' && value != 'Female')) {
                      return 'Please enter either Male or Female';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: bYearController,
                  decoration: const InputDecoration(labelText: 'Birth Year'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birth year';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: bMonthController,
                  decoration: const InputDecoration(labelText: 'Birth Month'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birth month';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: bDayController,
                  decoration: const InputDecoration(labelText: 'Birth Day'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birth day';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: shsAttendedController,
                  decoration: const InputDecoration(labelText: 'SHS Attended'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the SHS you attended';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () => _pickImage('photo'),
                  icon: const Icon(Icons.photo),
                  label: const Text('Upload Photo'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () => _pickImage('birthCert'),
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload Birth Certificate'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: submitData,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
