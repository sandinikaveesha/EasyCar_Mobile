import 'package:flutter/material.dart';

import '../home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 55,
              backgroundColor: Color.fromRGBO(60, 60, 68, 100),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image(image: AssetImage("")),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Easy Car",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
