// import 'package:chatgpt_course/constants/constants.dart';
// import 'package:chatgpt_course/models/voice_chat_model.dart';
// import 'package:chatgpt_course/services/api_service.dart';
// import 'package:chatgpt_course/services/api_services_voice.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// import '../services/assets_manager.dart';
// import '../services/services.dart';

// class VoiceScreen extends StatefulWidget {
//   @override
//   VoiceScreenState createState() => VoiceScreenState();
// }

// class VoiceScreenState extends State<VoiceScreen>
//     with TickerProviderStateMixin {
//   late stt.SpeechToText speech;
//   bool _isListening = false;
//   // stt.SpeechToText _speech = stt.SpeechToText();
//   String _text = 'Ask me anything !!';
//   late AnimationController animationController;
//   late Animation<double> animation;
//   final List<ChatMessage> messages = [];
//   var scrollController = ScrollController();
//   scroolMethod() {
//     scrollController.animateTo(scrollController.position.maxScrollExtent,

//      duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//   }
//   // late final String msg;

//   @override
//   void initState() {
//     super.initState();
//     speech = stt.SpeechToText();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//     animation = Tween<double>(begin: 1, end: 2).animate(animationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           animationController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           animationController.forward();
//         }
//       });
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await speech.initialize(
//         onStatus: (status) {
//           // if (status == stt.SpeechToTextStatus.error) {
//           //   print('Error occurred in recognizing speech.');
//           // }
//         },
//         onError: (error) {
//           print('Error occurred in recognizing speech: $error');
//         },
//       );
//       if (available) {
//         setState(() {
//           _isListening = true;
//         });
//         animationController.forward();
//         speech.listen(
//           onResult: (result) {
//             setState(() {
//               _text = result.recognizedWords;
//             });
//           },
//         );
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//       });
//       animationController.stop();
//       animationController.reset();
//       speech.stop();

//       messages.add(ChatMessage(text: _text, type: ChatMessageType.user));
//       var msg = await ApiSercivesVoice.sendMessage(_text);
          

//       setState(() {
//         messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       //   // centerTitle: false,
//       //   elevation: 5,
//       //   leading: Padding(
//       //     padding: const EdgeInsets.all(5.0),
//       //     child: Image.asset(AssetsManager.openaiLogoo),
//       //   ),
//       //   title: Column(children: const <Widget>[
//       //     Text(
//       //       'Voice Assistant',
//       //       style: TextStyle(
//       //           color: Color.fromARGB(255, 0, 0, 0),
//       //           fontWeight: FontWeight.bold,
//       //           fontFamily: 'SpectralSC',
                
//       //           fontSize: 17),
//       //     ),
//       //     SizedBox(width: 5),
//       //     Text(
//       //       'ChatBot ',
//       //       style: TextStyle(
//       //         color: Color.fromARGB(255, 177, 1, 1),
//       //         fontWeight: FontWeight.w600,
//       //         fontSize: 8,
//       //       ),
//       //     ),
//       //   ]),
         
//       //   backgroundColor: Colors.orange[200],
//       //   shape: const RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.only(
//       //     bottomLeft: Radius.circular(25),
//       //     bottomRight: Radius.circular(25),
//       //   )),

//       //   actions: [
//       //     IconButton(
//       //       onPressed: () async {
//       //         await Services.showModalSheet(context: context);
//       //       },
//       //       icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
//       //     ),
//       //   ],
         
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Text(
//                 _text,
//                 style: TextStyle(
//                     color: _isListening ? Colors.black87 : Colors.black54,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//                 child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: Colors.orange.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 controller: scrollController,
//                 shrinkWrap: true,
//                 itemCount: messages.length,
//                 itemBuilder: (BuildContext context, index) {
//                   var chat= messages[index];
                  
//                   return chatBubble(
//                       chattext:  chat.text,
//                       type:  chat.type);

//                   // const Text(
//                   //   "Developed by Niraj",
//                   //   style: TextStyle(
//                   //       color: Colors.black87,
//                   //       fontWeight: FontWeight.w500,
//                   //       fontSize: 20),
//                   //
//                   // )
//                 },
//               ),
//             )),
//             SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: _listen,
//               child: CircleAvatar(
//                 backgroundColor: Colors.orange[200],
//                 radius: 35,
//                 // child: Icon(
//                 //   _isListening ? Icons.mic : Icons.mic_none,
//                 //   color: Colors.white,
//                 // ),
//                 child: Center(
//                   child: ScaleTransition(
//                     scale: animation,
//                     child: Icon(
//                       _isListening ? Icons.mic : Icons.mic_none,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                       size: 25.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget chatBubble({required chattext, required ChatMessageType ?type}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Image.asset(
//             AssetsManager.userImage,
//             // : AssetsManager.botImage,
//             height: 30,
//             width: 30,
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.all(12.0),
//             margin: const EdgeInsets.only(bottom: 8),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(12),
//                   bottomRight: Radius.circular(12),
//                   bottomLeft: Radius.circular(12)),
//             ),
//             child: Text(
//               "$chattext",
//               style: TextStyle(
//                   color: cardColor, fontSize: 15, fontWeight: FontWeight.w400),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
