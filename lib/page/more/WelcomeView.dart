import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.only(top: 40, bottom: 10, left: 15, right: 15),
      // height: size.height *3/5,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0 , end: 1.0),
        duration: const Duration(milliseconds: 1200),
        builder:(BuildContext context, double value,Widget? child){
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(top: value*50),
              child: child,
            ),
          );
        } ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/Flutter_Logo_Sticker_by_TheMaeBLifes-removebg-preview.png'),
              fit: BoxFit.cover,
              
            ),
            Text(
              'WELCOME',
              style: GoogleFonts.rubikBubbles(
                textStyle: TextStyle(
                  fontSize: 60,
                  color: Colors.lightBlue.shade200
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}