import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/models/voice_chat_model.dart';

import 'package:chatgpt_course/services/api_services_voice.dart';
import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_to_text.dart';

import '../services/assets_manager.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

// late stt.SpeechToText speech;
SpeechToText speechToText = SpeechToText();
var text = 'Press & hold the button to use Assistant  ';
var _isListening = false;
final List<ChatMessage> messages = [];
var scrollController = ScrollController();
scroolMethod() {
  scrollController.animateTo(scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
}

class _VoiceScreenState extends State<VoiceScreen> {

  void clearChat()
  {
    setState(() {
      messages.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(168, 255, 255, 255),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: _isListening,
        // animate: true,
        duration: const Duration(milliseconds: 2000),
        glowColor: Color.fromARGB(255, 58, 14, 14),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!_isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  _isListening = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                      
                    });
                  });
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              _isListening = false;
            });
            speechToText.stop();
            messages.add(ChatMessage(text: text, type: ChatMessageType.user));

            var msg = await ApiSercivesVoice.sendMessage(text);

            setState(() {
              messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.orange[200],
            radius: 35,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none,
                color: Colors.black),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        elevation: 5,

        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(AssetsManager.openaiLogoo),
        ),
        title: Column(children: const <Widget>[
          Center(
            child: Text(
              'Voice Assistant',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpectralSC',
                  fontSize: 17),
            ),
          ),
          SizedBox(width: 5),
          Text(
            'ChatBot ',
            style: TextStyle(
              color: Color.fromARGB(255, 177, 1, 1),
              fontWeight: FontWeight.w600,
              fontSize: 8,
            ),
          ),
        ]),
        actions: [
          IconButton(onPressed: ()
          {
           // chatProvider.clearMessages();
            clearChat();
            print("all cleared");
          }, 
          icon: Icon(Icons.clear_all_rounded)),
  
          
          
        ],

        backgroundColor: Colors.orange[200],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),

        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       await Services.showModalSheet(context: context);
        //     },
        //     icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
        //   ),
        // ],
        // body
      ),
      //body
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 236, 235, 231),
            ], // define the gradient colors here
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  color: _isListening ? Colors.black87 : Colors.black54,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 245, 193, 193).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  var chat = messages[index];
                  return chatBubble(chattext: chat.text, type: chat.type);
                },
              ),
            )),
            // SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '💻 Developed by',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    // fontFamily: 'SpectralSC',
                  ),
                ),
                Text(
                  '- Niraj',
                  style: TextStyle(
                    color: Color.fromARGB(255, 248, 192, 108),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'SpectralSC',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatBubble({required chattext, required ChatMessageType? type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            AssetsManager.userImage,
            // : AssetsManager.botImage,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
            child: Text(
              "$chattext",
              style: TextStyle(
                  color: cardColor, fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

Widget chatBubble({required chattext, required ChatMessageType? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
      
        backgroundColor: Colors.white,
        child: Image.asset(
          AssetsManager.userImage,
          // AssetsManager.open_aiImage,
          height: 30,
          width: 30,
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
          ),
          child: Text(
            "$chattext",
            style: TextStyle(
                color: cardColor, fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}
