// ignore: file_names
import 'package:flutter/material.dart';



class InforView extends StatelessWidget {
  const InforView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 10, left: 15, right: 15),
      // height: size.height *3/5,
      child:const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Image(
            image: AssetImage('assets/images/Designer_girl_Customizable_Cartoon_Illustrations___Bro_Style-removebg-preview.png'),
            fit: BoxFit.cover,
            
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'This app is designed by Nghia Lio. This is demo app.'
              'This app is written by Flutter. A Language of Google '
              'Please access to website NghialioDev.com.vn to know more about this app. '
              'NumberPhone: 398484449, '
              'email: jhdfjhsdfsdjhdfhsdf'
              ,
              style: TextStyle(
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}