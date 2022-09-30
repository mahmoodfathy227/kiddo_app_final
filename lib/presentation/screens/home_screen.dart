import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipping_app/presentation/screens/CompetitonScreen.dart';
import 'package:shipping_app/buisiness%20logic/Login%20Controller.dart';
import 'package:shipping_app/buisiness%20logic/UserInfo%20Controller.dart';
import 'package:shipping_app/constants.dart';
import 'package:shipping_app/presentation/screens/Authentication/login_screen.dart';
import 'package:shipping_app/presentation/screens/Quizz%20Pages/Quizzpage3.dart';
import 'package:shipping_app/presentation/screens/welcome_screen.dart';
import '../../buisiness logic/UserInfo Controller.dart';
import 'Quizz Pages/Quizzpage1.dart';
import 'Quizz Pages/Quizzpage2.dart';
import 'Simple loading Screen.dart';
import 'developer_contact.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = Get.find();
List<Widget> pages = [
WelcomeScreen(),
  Quizzpage1(),
  Quizzpage2(),
  Quizzpage3(),
  Competition()


];
    return GetBuilder<UserInfo>(
      builder: (UserInfo) {
        UserInfo.getDataDirectlyAfterLoggin();

        return  Scaffold(

            drawer: Drawer(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 33),
                borderRadius: BorderRadius.circular(188),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 185.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                          highlightColor: Colors.amberAccent,
                          baseColor: Colors.black,
                          child: GestureDetector(
                              onTap: (){
                                UserInfo.getToCompetitonScreen(context);
                              },
                              child: Text('الأوائل' , style: TextStyle(fontSize: 30.sp),))
                      ),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> DeveloperContact()   ));
                        },
                          child: Text('تواصل معنا', style: TextStyle(fontSize: 22.sp , color: Colors.white),),

                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                          onTap: (){
                            UserInfo.logOut();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                    (route) => false);
                          }
                          ,
                          child: Text('تسجيل خروج', style: TextStyle(fontSize: 22.sp, color: Colors.white),)),
                      SizedBox(height: 120,),
                      ElevatedButton(onPressed: (){
                        UserInfo.getToQuizzScreen(context);
                      },
                        style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(Colors.deepOrange) ,

                        ),
                        child:  Text('ابدأ الاختبار', style: TextStyle(fontSize: 22.sp),),
                      )

                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,

            appBar: AppBar(
              actions: [
                GetBuilder<LoginController>(
                  builder: (LoginController) =>

                      Padding(
                        padding:  EdgeInsets.fromLTRB(0, 0, 15.w, 0),
                        child: Row(
                          children: [
                            Text('${UserInfo.userUsername} ' , style: TextStyle(fontSize: 15),),
                            Icon(Icons.monetization_on_sharp),
                            Row(
                              children: [
                                UserInfo.isupdated?  Image.asset('assets/pluspoints.gif' , height: 25, width: 30,) :SizedBox() ,
                                Shimmer.fromColors(
                                    highlightColor: Colors.yellow,
                                    baseColor: Colors.white,
                                    direction: ShimmerDirection.rtl,
                                    child: Text( UserInfo.isupdated ? UserInfo.newScore.toString() : UserInfo.userOldScore.toString())),

                              ],
                            )


                          ],
                        ),
                      ),



                ),



              ],
              title: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 0, 0, 0),
                child: Text('الصفحة الرئيسية' , style: TextStyle(fontSize: 19.sp),),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66)
              ) ,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                    color: Color(0xff00E26B)
                ),

              ),
            ),

            body: pages[UserInfo.index]
        );
      }

    );

}
}
