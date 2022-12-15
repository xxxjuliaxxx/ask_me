import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 178, 205),
        title: Text(
          'Prepare good questions',
          style: GoogleFonts.lato(fontSize: 21),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 212, 29, 62),
                Color.fromARGB(255, 27, 215, 146)
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ask me a question and I will tell you the answear.',
              style: GoogleFonts.abel(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: const Text('Check the answear'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 45, 177, 200),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SecondPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final result = random.nextBool();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 178, 205),
        title: Text(
          'Try again',
          style: GoogleFonts.lato(fontSize: 22),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 220, 0, 40),
                Color.fromARGB(255, 0, 255, 119)
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (result == true)
              Text(
                'The answear is ... YES',
                style: GoogleFonts.lato(fontSize: 21),
              ),
            if (result == false)
              Text(
                'The answear is ... NO',
                style: GoogleFonts.lato(fontSize: 21),
              ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Ask me again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: result == true ? Colors.green : Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
