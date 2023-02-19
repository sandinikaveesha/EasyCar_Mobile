import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_bottom_navigation_bar.dart';
import 'package:rental_car_app/Models/Customer.dart';
import 'package:rental_car_app/Provider/user_provider.dart';
import 'package:rental_car_app/Screens/Onboarding/login_screen.dart';

import '../Components/custom_back_button.dart';
import '../Components/custom_textbox.dart';
import '../Constants/constant.dart';
import '../Controllers/CustomerController.dart';
import '../Repositories/customer_repository.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  String _profileImg =
      "iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAUrSURBVHgB7ZyLcds4EIb/u7kC1MFtB1YHxlVw6sBIBXEHYgdJKqA7cFKBlArsVCClArmDhBuSY5nZJfEkKYXfzI5tmAQXP94PElhYWFhYWAjkL0zPurGbyqj5Hc3v5xwre2nsubJvzc9n/GGsKruv7LGyU2U/Iu3UxGXxu+hXhalsh3jBhqxsnnU12MoOyC9c1w7Nsy8Wg2mEu3ghCX5VlduwEnW7uGnuXylxcwdj8NqGHjyeU+IC2sj3cOsYWOACaRLEorKgLmLOtjRyifkAN+EM8mEqe3Dw4wNmBFX2hGHhCONBGBbyCTOo0oT+qsP/M5iODYb9I0wEod+5j9A7g7EpMDMRCbp43IlYzA8LvYPjtIya2U89jqwxXwh6xj9hJLTedtL2xAOCLmL23tnissVrIegi3iETBLkNOSGdeFz9t6iHPYfOMzisSPys3Ol5Qwk5xyzi4cTsMDwATj2utD3xJ8VCH6rEsoW7cF3bIp6PStwGCTkgT9dfIly81krEwWnQ0pcEizxV12Xu7GqxvadBnjT+Qsqd2Fy30MXg5/HqCp1dv8bwwqxFHDshzuix4Qays4RwCLoQLm1qodzLvWdMk2KQoS18xHilr3CPQhWxQBxSKdwhEEKGHEG6JkHK3NgqZ5CwZFvI7VMMhHRNAilx/Ys4pMG11S7+uyei/4WwL4hDWmjYo9409+XY3NvlP8TxSQjbaBf3CWiEsM+IQxLwG8KR7o0dm+6FsFvtYk3AteDIixJ5LC8IR7o3hYAvQpziMl2fgF2+Ip7UCc61CLoXwqIFfEY8koA3CEe6N4WfUtPgJWAux/ZCmEF4L2yE8BR+HiE/zxlpyd4gDVLcj/CnRPphVss6Nm5psBs7vmopII/fth5xbJFnPtxCiBRQci4V3PBru2MuIo61JxOlQU4BGas8oxWC/3/eaBOGz79YpGXWAjLaSnCIpVgZ7zJ7AZkHxIv3gDxEaXBAvk6kS4Fw8QrkgSA3Lc5IAuY8cUDw35XL6Y8Rnikulf2jRMCDUeqErZHvlYIj6lUUQt0Z3OLtfPzYGE8nPyP/qw3SFFGcs2sCfhfCcuZ4yxH5qqUPzqtG2lROyuGYOeulcSuEeZV6aSpzwp+DNND3roFSJAbXj4FH4elbkd4LYRtcP3dCWNBaKE+dUldj7t04E0rUQ6UU78q1Q4wSaTL4IMRvEcAKsrMGYWyRTrA+YwEswrBKnIRAdpAHsT4Qhl+DyCUkwQ8pvVEbaQZxpVA7xDimiK69p1HiiG4WDggrhYR5vGzoeuJUqiUHJMBCdswO3NcnXok6x1Psqq0w/IrX0JEPi7A0OiOJ0XdmxCK+SoVA0DOu8LwnSelrMYpT2maQ5hAhPwS/DC+RufS17JQH3Xeuy3Gm0Je14oPpXLeF3sQkh6D3qObsunIshwZ4GPDDIK7TCeK+56Ft25ZzT9kHA70z6RteWWRG2ww69TiWorf1ZeXpI1uOzSnRMW1moTk2FT4+Rh8o94HgN0ieClf/OC2EkSG4izgVsxWvheAm4lTMWrwWwvBqC//fYDwMhrdJZ/HRiXNcjmpwoizyYeC2vzyn7zm8wcJt+YqrTok0pdKgPrHl8ly+5h4JyfH9QEI9cb9zvJ43rHnL8Gvzk/8+4vdTooTXw943eP3uoGtJ2lf2DmGvVEyCxXw+PmZwwVgsn79LAq/SSO+3pbYdrnz/mlCXjNSfAOXOYfSeNUcn4ssabz9Eu2qMOtcdm5/c0XzH6wdoc5/UWlhYWFhYyMNP0c+RF+x3w3EAAAAASUVORK5CYII=";

  var _customerController = CustomerController(CustomerRepository());
  @override
  Widget build(BuildContext context) {
    Customer user = context.watch<User>().user;
    _firstName.text = user.firstName.toString();
    _lastName.text = user.lastName.toString();
    _phone.text = user.phoneNo.toString();
    _email.text = user.email.toString();
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CustomBackButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const Text(
                  "My Profile",
                  style: mainHeadingLight,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 120,
              width: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.memory(
                    Base64Decoder().convert(_profileImg),
                    fit: BoxFit.cover,
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextbox(hintText: "First Name", controller: _firstName),
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
            CustomTextbox(hintText: "Email Address", controller: _email),
            const SizedBox(
              height: 20,
            ),
            Button(
                buttonText: "Log Out",
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                })
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
