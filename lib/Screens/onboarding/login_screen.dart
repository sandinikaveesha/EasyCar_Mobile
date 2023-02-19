import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'package:rental_car_app/Screens/Onboarding/register_screen.dart';

import '../../Components/button.dart';
import '../../Components/custom_textbox.dart';
import '../../Constants/constant.dart';
import '../../Provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
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
                      "Login to your account",
                      style: mainHeadingLight,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextbox(hintText: "Username", controller: _email),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextbox(hintText: "Password", controller: _password),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonText: "Sign In",
                      action: (){
                        _login(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()),);
                      }),
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _login(BuildContext context){
    print("login");
    Provider.of<User>(context, listen: false).login(_email.text, _password.text, context);
  }
}
