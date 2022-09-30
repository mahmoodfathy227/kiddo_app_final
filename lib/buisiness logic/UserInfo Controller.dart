import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Login Controller.dart';
class UserInfo extends GetxController{
  LoginController loginController = LoginController();
 String? userUsername;
   int? userOldScore;
   int? newScore;
  bool isupdated = false;
  bool isUpdatingScore = false;
  int index = 0 ;

  @override
  void onInit()  async{
    update();
    userUsername = await FirebaseAuth.instance.currentUser?.displayName;
    update();
    await getScore();
    super.onInit();

  }




  void logOut() async{
   try{
     index = 0;
     userUsername = '';
     userOldScore = 0;
     update();
     await FirebaseAuth.instance.signOut();
     await prefs.setBool('loggedin' , false);
   }catch (e){
     Fluttertoast.showToast(
         msg: "حدث خطأ ما من فضلك أعد المحاولة",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }

  }
void getIndexForQuizzStartPoint(){
  index ++;
  print('تم التزويد');
  update();
}
  void getToCompetitonScreen(BuildContext context){
    index = 4;
    print('تم التغيير');
    update();
    Navigator.of(context).pop();
  }
  void getToQuizzScreen(BuildContext context){
    index = 1;
    print('تم التغيير');
    update();
    Navigator.of(context).pop();
  }
Future getScore() async{
  update();

  if(userUsername != null){
    await FirebaseFirestore.instance.collection(userUsername!).doc('Details').get().then((value) {
      userOldScore = value['your score'];

    } );
  }

  update();

}


Future <void> addNewScore() async{
  isupdated = true;
  isUpdatingScore = true;
  update();
  print('هبدأ');
  newScore = 10 + userOldScore!;
  print(newScore);
  updateNewScore();
  print('خلصت');
  index++;
  update();

}

  Future <void> updateNewScore() async{
    print('هبدأ');
   await  FirebaseFirestore.instance.collection(userUsername!).doc('Details').update({
      'your score' : newScore

    });
    update();
    print('خلصت');
    userOldScore = newScore;
    update();
    Future.delayed(Duration(seconds: 2), (){
      isupdated =  false;
update();
    });


  }

  void getDataDirectlyAfterLoggin()async{

    userUsername = await FirebaseAuth.instance.currentUser?.displayName;
    await getScore();
  }




}