import 'package:flutter/material.dart';
import 'package:giao_dien_08/page/MainScreen.dart';
import 'package:giao_dien_08/page/more/SingUpView.dart';

class LogInView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final formKey; //key form
  const LogInView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 10, left: 15, right: 15),
        // height: size.height *3/5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/Free_Vector___Access_control_system_abstract_concept-removebg-preview.png'),
              fit: BoxFit.cover,
              
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration:const InputDecoration(
                      labelText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gapPadding: 3.0
                      ),
                      
                    ),
                    style:const TextStyle(fontSize: 21),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter correct email';
                      }else if( RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value!)){
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration:const InputDecoration(
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gapPadding: 3.0
                      )
                    ),
                    style:const TextStyle(fontSize: 21),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter password';
                      }else{
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const Page2() )
                        );
                      }
                    },
                    obscureText: true,
                  ),
                  Hero(
                    tag: 'Sign-up',
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpView() )
                        );
                      }, 
                      child:const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ),
                  )
                ],
              )
            )
            
          ],
        ),
      ),
    );
  }
}



