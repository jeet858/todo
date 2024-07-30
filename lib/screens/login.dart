import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/screens/register.dart';
import 'package:todo/widgets/top_appbar.dart';
import '../controller/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginData = {
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
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height,
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
                    height: 310,
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
                          'Login',
                          style: TextStyle(color: kPrimaryColor, fontSize: 28),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                loginData['email'] = value;
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
                                loginData['password'] = value;
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
                                await login(loginData);
                            if (result['statusCode'] != 200) {
                              _showAlertDialog(
                                  'Login failed with status code: ${result['statusCode']}');
                            } else {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          color: loginData['email']!.isNotEmpty &&
                                  loginData['password']!.isNotEmpty
                              ? kActiveButtonColor
                              : kInActiveButtonColor,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                          textColor: Colors.white,
                          child: const Text('Login'),
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
                            const Text('Don’t You Have Account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Register()));
                              },
                              child: const Text(
                                'Sign Up',
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
