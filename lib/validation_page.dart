import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPassHidden = false;
  bool isBtnActive = false;
  bool passCapsCharValidation = false;
  bool passSmallCharValidation = false;
  bool passNumValidation = false;
  bool passSymbolValidation = false;
  bool passCharValidation = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final capsCharRegex = RegExp(r'[A-Z]');
    final smallCharRegex = RegExp(r'[a-z]');
    final symbolRegex = RegExp(r'[/^!@#%^&*]');

    setState(() {
      passCharValidation = false;
      if (password.length >= 8) {
        passCharValidation = true;
      }
      passNumValidation = false;
      if (numericRegex.hasMatch(password)) {
        passNumValidation = true;
      }
      passCapsCharValidation = false;
      if (capsCharRegex.hasMatch(password)) {
        passCapsCharValidation = true;
      }
      passSmallCharValidation = false;
      if (smallCharRegex.hasMatch(password)) {
        passSmallCharValidation = true;
      }
      passSymbolValidation = false;
      if (symbolRegex.hasMatch(password)) {
        passSymbolValidation = true;
      }
      isBtnActive = false;
      if (passCharValidation &&
          passNumValidation &&
          passCapsCharValidation &&
          passSmallCharValidation &&
          passSymbolValidation) {
        isBtnActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Create Your Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Set a password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please create a secure password including the following criteria below.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      obscureText: !isPassHidden,
                      cursorColor: const Color(0xFF3F3D56),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF3F3D56),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPassHidden == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassHidden = !isPassHidden;
                            });
                          },
                        ),
                      ),
                      onChanged: (password) => onPasswordChanged(password),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              passCharValidation == true
                                  ? Icons.task_alt
                                  : Icons.radio_button_unchecked,
                              color: passCharValidation == true
                                  ? Colors.green
                                  : Colors.black54,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Must be atleast 8 characters',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: passCharValidation == true
                                    ? Colors.green
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              passNumValidation == true
                                  ? Icons.task_alt
                                  : Icons.radio_button_unchecked,
                              color: passNumValidation == true
                                  ? Colors.green
                                  : Colors.black54,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Must contain atleast 1 Number',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: passNumValidation == true
                                    ? Colors.green
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              passCapsCharValidation == true
                                  ? Icons.task_alt
                                  : Icons.radio_button_unchecked,
                              color: passCapsCharValidation == true
                                  ? Colors.green
                                  : Colors.black54,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Must contain atleast 1 Letter in Capital Case',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: passCapsCharValidation == true
                                    ? Colors.green
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              passSmallCharValidation == true
                                  ? Icons.task_alt
                                  : Icons.radio_button_unchecked,
                              color: passSmallCharValidation == true
                                  ? Colors.green
                                  : Colors.black54,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Must contain atleast 1 Letter in Small Case',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: passSmallCharValidation == true
                                    ? Colors.green
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              passSymbolValidation == true
                                  ? Icons.task_alt
                                  : Icons.radio_button_unchecked,
                              color: passSymbolValidation == true
                                  ? Colors.green
                                  : Colors.black54,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Must contain atleast 1 Special Charecter',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: passSymbolValidation == true
                                    ? Colors.green
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MaterialButton(
                      color: Colors.black,
                      height: 40,
                      disabledColor: Colors.grey,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: isBtnActive == true
                          ? () {
                              setState(() async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                await Navigator.pushNamed(context, '/landing');
                              });
                            }
                          : null,
                      child: const Text(
                        'Change Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}