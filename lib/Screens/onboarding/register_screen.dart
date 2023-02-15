import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_textbox.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Create an account",
                      style: mainHeadingLight,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextbox(
                        hintText: "First Name", controller: _firstName),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextbox(hintText: "Last Name", controller: _lastName),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextbox(hintText: "Phone Number", controller: _phone),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextbox(
                        hintText: "Email Address", controller: _email),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextbox(hintText: "Password", controller: _password),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      buttonText: "Sign Up",
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginScreen()));
                        }),
                        child: const Text(
                          "Already have an account? Login",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
