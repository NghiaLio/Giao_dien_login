// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:giao_dien_08/page/more/LogInView.dart';
import 'package:giao_dien_08/page/more/WelcomeView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'more/InforViiew.dart';

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  final _controller = PageController();

  int _currentPage = 0;

  void nextPage(){
    _controller.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInSine);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            SizedBox(
              height: size.height*3.7/5,
              child: PageView(
                onPageChanged: (int index) =>setState(() {
                  _currentPage = index;
                }) ,
                controller: _controller,
                children: [
                  const WelcomeView(),
                  const InforView(),
                  LogInView(formKey: formKey,)
                ],
              ),
            ),
            // const SizedBox(height: 40,),
            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect:WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.lightBlue.shade200
              ),
            ),
            const SizedBox(height: 50,),
            AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              height: 70,
              width: _currentPage ==0 ? size.width*4.5/7 :
                     _currentPage == 1 ? size.width*2/7 : 
                     size.width*3/7,
              duration:const Duration(milliseconds: 500),
              decoration:  BoxDecoration(
                color: Colors.lightBlue.shade200,
                borderRadius:const BorderRadius.all(Radius.circular(40))
              ),
              curve: Curves.easeInSine,
              child: _currentPage ==0 ? button(textButton: 'Let\'s Started',onPressed:nextPage) :
                      _currentPage ==1 ? button(textButton: 'Next',onPressed: nextPage,) :
                      button(textButton: 'Log In', onPressed: () {
                        if(formKey.currentState!.validate()){
                          
                        }
                      },)
              ),

              
          ],
        ),
      )
    );
  }
}

// Button
// ignore: camel_case_types, must_be_immutable
class button extends StatelessWidget {
  VoidCallback onPressed;

  final String textButton;
  button({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      
      child: Text(
        textButton,
        style: GoogleFonts.rubikBubbles(
          textStyle:TextStyle(fontSize:30 , color: Colors.grey.shade700)
        ),
      ),
    );
  }
}


// AnimationTween












