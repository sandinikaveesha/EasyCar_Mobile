import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_textbox.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Controllers/CustomerController.dart';
import 'package:rental_car_app/Repositories/customer_repository.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import '../../Utils/utility_helper.dart';
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
  final _confirmPassword = TextEditingController();

  String imgString = sampleUpload;

  // Dependency
  var _customerController = CustomerController(CustomerRepository());

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
            InkWell(
              onTap: null,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      Base64Decoder().convert(sampleLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
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
                    CustomTextbox(
                        hintText: "Confirm Password",
                        controller: _confirmPassword),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      buttonText: "Sign Up",
                      action: () {
                        _register(context);
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
                                  builder: (context) => const LoginScreen()));
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

  // Img Handle
  _imgPicker() async {
    String output;
    ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
      output = Utility.base64String(await img!.readAsBytes());
      setState(() {
        imgString = output;
      });
    });
  }

  // Registration Process
  _register(BuildContext context) async {
    if (_password.text == null ||
        _password.text == "" ||
        _firstName.text == null ||
        _firstName.text == "" ||
        _lastName.text == null ||
        _lastName.text == "" ||
        _email.text == null ||
        _email.text == "" ||
        _phone.text == null ||
        _phone.text == "" ||
        _confirmPassword.text == null ||
        _confirmPassword.text == "")
      return Utility.notification(
          "Required Field are Missing!", context, false);

    if (_password.text != _confirmPassword.text)
      return Utility.notification("Password Does not Matched!", context, false);
    var data = {
      'firstName': _firstName.text,
      'lastName': _lastName.text,
      'username': _email.text,
      'phone': _phone.text,
      'password': _password.text,
      'img': null
    };
    if (_customerController.register(data)) {
      Utility.notification("Successfully Registered", context, true);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      Utility.notification("Something Went Wrong!", context, false);
    }
  }
}
