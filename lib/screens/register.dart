import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/screens/login.dart';
import 'package:todo/widgets/top_appbar.dart';

import '../controller/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var registerData = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
  };
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF00B3A1), // #00B3A1
                            Color(0xFF85CAC3), // #85CAC3
                            Color(0xFFFFFFFF), // #D9D9D9
                          ],
                          stops: [
                            0.0,
                            0.6146,
                            1.0
                          ], // Define the stops for each color
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Center(
                child: Material(
                  elevation: 4,
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0), // Border radius of 15
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 425,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0), // Border radius of 15
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Register',
                          style: TextStyle(color: kPrimaryColor, fontSize: 28),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                registerData['firstName'] = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Your First Name',
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              fillColor: Color(0xFFABABAB),
                              focusColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                registerData['lastName'] = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Last Name',
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              fillColor: Color(0xFFABABAB),
                              focusColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                registerData['email'] = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Email-Id',
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              fillColor: Color(0xFFABABAB),
                              focusColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                registerData['password'] = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Password',
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              fillColor: Color(0xFFABABAB),
                              focusColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () async {
                            Map<String, dynamic> result =
                                await register(registerData);
                            if (result['statusCode'] != 200) {
                              _showAlertDialog(
                                  'Sign Up failed with status code: ${result['statusCode']}');
                            } else {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          color: registerData['email']!.isNotEmpty &&
                                  registerData['password']!.isNotEmpty
                              ? kActiveButtonColor
                              : kInActiveButtonColor,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                          textColor: Colors.white,
                          child: const Text('Register'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 1,
                              color: Colors.grey,
                            ),
                            const Text('Or',
                                style: TextStyle(color: Colors.grey)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already Have An Account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Login()));
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
