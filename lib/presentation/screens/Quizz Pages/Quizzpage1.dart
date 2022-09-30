import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipping_app/buisiness%20logic/UserInfo%20Controller.dart';
import 'package:shipping_app/presentation/Widgets/CustomField.dart';
import 'package:shipping_app/presentation/screens/Quizz%20Pages/Quizzpage2.dart';

import '../../../constants.dart';
import '../../Widgets/Custom Quizz.dart';
import '../home_screen.dart';
class Quizzpage1 extends StatefulWidget {
   Quizzpage1({Key? key}) : super(key: key);

  @override
  State<Quizzpage1> createState() => _Quizzpage1State();
}

class _Quizzpage1State extends State<Quizzpage1> {
TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = Get.find();
    return Material(
      color: generalColor,
      child: SingleChildScrollView(
        child: Column(

children: [


         CustomQuizzimage(
          imageUrl: 'assets/elephant.jpg',
        ),

  CustomField(fieldText: 'اكتب اسم الحيوان',
          myInputType: TextInputType.text,
          fieldIcon: Icons.question_answer,
          isObsecureText: false,
          ispassword: false,
          customController: answerController
  ),
  GetBuilder<UserInfo>(
    builder: (UserInfo) => ElevatedButton(
      style: myCustomButtonSettings ,
        onPressed:
            (){
          answerChecker(UserInfo, context);

        }
        ,
        child: Align(
          alignment: Alignment.center,
            child: Text('جاوب الأن'))

    ),

  )

],
        ),
      ),
    );
  }

  void answerChecker(UserInfo UserInfo, BuildContext context) {
            if(answerController.text.isNotEmpty){
      if( answerController.text ==  "الفيل" || answerController.text=="فيل"){
        UserInfo.addNewScore();







      } else{
        showDialog(
          context: context,
          builder: (context)=>

              Container(
                height: 350.h,
                width: 350.w,
                child: Column(
                  children: [
                    Container(
                      height: 350.h,
                      width: 350.w,
                      child: Image.asset('assets/wrong.gif'),

                    ),
                    Container(
                        width: 140.w,
                        height: 44.h,
                        child: ElevatedButton(

                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Text('أعد المحاولة'),
                              SizedBox(width: 6,),
                              Icon(Icons.settings_backup_restore,
                                color: Colors.white,
                                size: 30,

                              ),
                            ],
                          ),

                        )
                    ),


                  ],
                ),
              ),

        );


      }

    }
    else{
      Fluttertoast.showToast(
          msg: "لا بد من كتابة اجابة",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}
