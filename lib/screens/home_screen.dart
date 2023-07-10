import 'package:chatgpt_course/ai%20image%20screen/ai_image_screen.dart';
import 'package:chatgpt_course/screens/chat_screen.dart';
import 'package:chatgpt_course/screens/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
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
                height: 50,
              ),
              //code for services -------------------
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 39, 40).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 247, 245, 245)
                              .withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/text_chat.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                        const SizedBox(width: 10),
                        Text('Text Chat'),
                        const SizedBox(width: 100),
                        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orange[300],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()),
                            );
                            // add your button functionality here
                          },
                          child: Icon(Icons.navigate_next_rounded),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 39, 40).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 247, 245, 245)
                              .withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/voice_chat.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                        const SizedBox(width: 10),
                        Text('Voice Chat'),
                        const SizedBox(width: 90),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[300],
                          ),
                          onPressed: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VoiceScreen()),
                            );
                            // add your button functionality here
                          },
                          child: Icon(Icons.navigate_next_rounded),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 39, 40).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 247, 245, 245)
                              .withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ai_image.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                        const SizedBox(width: 10),
                        Text('Generate AI Image'),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[300],
                          ),
                           onPressed: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiImageScreen()),
                            );
                            // add your button functionality here
                          },
                          child: Icon(Icons.navigate_next_rounded),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
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
          ),
        ],
      ),
    );
  }
}
