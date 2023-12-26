import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatelessWidget {

  final keyForm = GlobalKey<FormState>();
  SignUpView({super.key});

  // void onchanged(value){
  //   if(keyForm.currentState!.validate()) return null;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
        tag: 'Sigh-up',
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image:const  AssetImage('assets/images/Typing_Customizable_Cartoon_Illustrations___Bro_Style-removebg.png'),
                    fit: BoxFit.cover,
                    height: size.height*2/10,
                    width: size.width*3/5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.rubikBubbles(
                      textStyle: TextStyle(fontSize: 40, color: Colors.grey.shade800)
                    ),
                  ),
                ),
                
                Form(
                  key: keyForm,
                  child:Column(
                    children: [
                      form(textLable: 'UserName', icon:const Icon(Icons.person, size: 30,),
                        // onchange: onchanged,
                        obscureText: false,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your UserName';
                          }
                          else if(value.length <4) return 'Username >= 4 ki tu';
                          else{
                            return null;
                          }
                        },
                      ),
                      form(textLable: 'Email', icon:const Icon(Icons.email, size: 30,),
                        // onchange: onchanged,
                        obscureText: false,
                        validator: (value) {
                          if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                             return 'Enter your email';
                          }
                            
                          else{
                            return null;
                          }
                        },
                      ),
                      form(textLable: 'Password', icon:const Icon(Icons.lock_outline, size: 30,),
                        // onchange: onchanged,
                        obscureText: true,
                        validator: (value) {
                          if(value!.isEmpty) return 'Enter your email';
                          else if(value.length<6) return 'Your password length must >=6';
                          else{
                            return null;
                          }
                        },
                      ),
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'If you have account',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 18),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 40,),
                AnimatedContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5 ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade200,
                    borderRadius:const BorderRadius.all(Radius.circular(30))
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: TextButton(
                    onPressed: (){
                      if(keyForm.currentState!.validate()){
                        print('sucees');
                      }else{
                        print('fail');
                      }
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.rubikBubbles(
                        textStyle: TextStyle(fontSize: 30, color: Colors.grey.shade800)
                      ), 
                    ),
                  ),
                )
                
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class form extends StatelessWidget {

  final String textLable;
  final Icon icon;
  final bool obscureText;
  String? Function(String?)? validator;
  // Function(String?) onchange;
  form({super.key, required this.textLable, 
        required this.icon, required this.validator, required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: textLable,
          prefixIcon: icon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          )
        ),
        style:const TextStyle(
          fontSize: 20
        ),
        obscureText: obscureText,
        // onSaved: onchange,
        validator: validator,
      ),
    );
  }
}