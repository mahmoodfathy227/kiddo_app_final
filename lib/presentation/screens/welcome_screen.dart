import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipping_app/buisiness%20logic/UserInfo%20Controller.dart';
import 'package:shipping_app/presentation/screens/home_screen.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
       children: [

         Image.asset('assets/whitekidsbackground.jpg' , fit: BoxFit.cover,
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
         ),
         GetBuilder<UserInfo>(
           builder: (UserInfo) =>  Column(

             children: [
               Padding(
                 padding: EdgeInsets.fromLTRB(0, 242.h, 0, 0),
                 child: Text('Welcome'+ ' ${UserInfo.userUsername}', style: TextStyle(fontSize: 33.sp , color: Colors.green),),
               ),
               Padding(
                 padding:  EdgeInsets.fromLTRB(0, 33.h, 0, 0),
                 child: Row(

                   children: [
                     Padding(
                       padding:  EdgeInsets.fromLTRB(22.w, 0, 0, 0),
                       child: Shimmer.fromColors(
                         highlightColor: Colors.yellowAccent,
                           baseColor: Color(0xffFEAC21),
                           child: Text('Your points ' +'${UserInfo.userOldScore}' , style: TextStyle(fontSize: 22.sp),)),
                     ),
SizedBox(width: 22,),
                     Image.asset('assets/Welcome.gif' , height: 188.h, width: 140.w,),


                   ],
                 ),
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: () async {
                 if (await ConnectivityWrapper.instance.isConnected) {
             UserInfo.getIndexForQuizzStartPoint();

                 } else {
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
                                 child: LottieBuilder.asset('assets/85405-no-connection.json' ,
                                 width: 350.0,
                                   height: 350.0,
                                 ),

                               ),

                               Container(
                                   width: 150.w,
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

               }, child: Text('ابدأ الاختبار'))
             ],
           ),

         ),
       ],
        ),
      ),
    );
  }
}
