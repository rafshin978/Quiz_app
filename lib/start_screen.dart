import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {key}) : super(key: key);
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /*
        adding transparency to image by opacity
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
        ),*/
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(141, 255, 255, 255),
        ),
        const SizedBox(height: 80),
         Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.lato(
            color:const Color.fromARGB(255, 253, 253, 253),
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            primary: Colors.white,
            elevation: 30,
            shadowColor: Colors.blueGrey,
            shape: const StadiumBorder(),
            side: const BorderSide(
                style: BorderStyle.solid, width: 0, color: Colors.blueAccent),
          ),
          icon: const Icon(Icons.arrow_right_sharp),
          label: const Text('Start Quiz!'),
        ),
      ],
    ));
  }
}
