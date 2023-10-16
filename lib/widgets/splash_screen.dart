import 'package:chatgpt_course/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_course/screens/chat_screen.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 4),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => HomeScreen()  
            )  
         )  
    );  
  }  

  //    @override
  //    Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  //    }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 244, 243, 243),
                  Color.fromARGB(255, 179, 243, 124),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
         ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 240,
              ),
              Image.asset(
                'assets/images/openai_logo.png',
                width: 100.0,
                height: 100.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Mindful AI',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpectralSC',
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'chatBOT',
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 143, 143),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitHourGlass(
                color: Color.fromARGB(255, 231, 191, 191),
                size: 50,
              ),
              const SizedBox(
                height: 190,
              ),
              const Text(
                '💻 Developed by',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'SpectralSC',
                ),
              ),
              const Text(
                '- Niraj',
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 1, 1),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpectralSC',
                ),
              ),
            ],
          
          )]
         ),
        ],
      ),
    );
  }
}
