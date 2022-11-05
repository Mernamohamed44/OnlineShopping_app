import 'package:final_project/modules/welcome_screen.dart';
import 'package:final_project/network/local/shared_pref.dart';
import 'package:final_project/shard/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
 await CacheHelper.init();
  token=CacheHelper.getData(key:'token');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }

}
class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: WelcomeScreen() ,
     );
  }

}