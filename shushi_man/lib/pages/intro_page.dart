import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_man/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            Text("SHUSHI MAN",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                )),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset("lib/images/toro.png"),
            ),
            const SizedBox(height: 25),
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Feel the taste of most popular Japanes food from anywhere and anytime",
              style: TextStyle(
                height: 2,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
