
import 'package:final_project/modules/signup_screen.dart';
import 'package:final_project/modules/signin_screen.dart';
import 'package:final_project/shard/components/components.dart';
import 'package:final_project/styles/themes.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
     backgroundColor: Colors.white,
     body:  SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children:  [
             const SizedBox(
               height: 100,
             ),
             Text('  S H O O P I N G',style: Themes().themeData.textTheme.headline1,),
             const Image(
                 image:NetworkImage('https://th.bing.com/th/id/R.eb1fbdfc6b5717156bb17f9e16f67442?rik=it8IyArk9INO9Q&pid=ImgRaw&r=0')),
             const SizedBox(height: 100,),
             defaultButton(
                 txt: 'SIGN Up',
                 onPress: (){
                   navigateTo(context, SignUpScreen());
                 }
             ),
             const SizedBox(height: 15,),
             defaultButton(
                 txt: 'SIGN IN',
                 onPress: (){
                   navigateTo(context,SignInScreen());
                 }
             )
           ],
         ),
       ),
     ),
    );
  }
}
