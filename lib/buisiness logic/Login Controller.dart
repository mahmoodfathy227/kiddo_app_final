import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shipping_app/buisiness%20logic/UserInfo%20Controller.dart';
import 'package:shipping_app/constants.dart';
import 'package:shipping_app/presentation/screens/Simple%20loading%20Screen.dart';
import 'package:shipping_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController{
  int?  userScore ;
 String? currentUsername ;
  late UserCredential userCredential;



  void login( BuildContext context , String email , String password) async{

String modifiedEmail = email.replaceAll(" ", "");

      try{
        update();
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: modifiedEmail, password: password, );
        currentUsername = await FirebaseAuth.instance.currentUser?.displayName;
        update();
        if(currentUsername != null){
          print(' دا اول واحد');
          getUserInfo();

          await prefs.setBool('loggedin', true);
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => LoadingScreen(),
            ),
                (route) => false,
          );

        } else{
          print('cannot login this person');
        }

      } on FirebaseAuthException catch(e){
        update();
        print(e.code);
        Fluttertoast.showToast(
            msg: " من فضلك تأكد من كلمة المرور والايميل "+
            "\n"+
            "${e.code.toString()}"
            ,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white,
            fontSize: 16.0);
      }



    ;
  }

  void getUserInfo() async{
    update();
    await FirebaseFirestore.instance.collection('${currentUsername}').doc('Details').get().then((value) {
      currentUsername = value['name'];
      print(' دا التانى');
      print(currentUsername);
      userScore = value['your score'];
      print(userScore);
    });
    update();
  }
}