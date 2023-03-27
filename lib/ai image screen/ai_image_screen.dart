import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/assets_manager.dart';

class AiImageScreen extends StatefulWidget {
  const AiImageScreen({super.key});

  @override
  State<AiImageScreen> createState() => _AiImageScreenState();
}

class _AiImageScreenState extends State<AiImageScreen> {
  var sizes = ["small", "Medium", "large"];
  var values = ["256x256", "512x512", "1024x1024"];
  String? dropValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'AI Image Generator',
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
        backgroundColor: Colors.orange[200],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 228, 228),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "eg 'Developer at Moon' ",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 228, 228),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.black,
                          ),
                          value: dropValue,
                          hint: const Text("select size"),
                          items: List.generate(
                            sizes.length,
                            (index) => DropdownMenuItem(
                              value: values[index],
                              child: Text(sizes[index]),
                            ),
                          ),
                          onChanged: (values) {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shadowColor: Colors.black,
                          shape: const StadiumBorder()),
                      onPressed: () {},
                      child: const Text("Generate")),
                )
              ],
            )),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
