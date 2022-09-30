import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class CustomQuizzimage extends StatelessWidget {
  CustomQuizzimage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


             Padding(
               padding: EdgeInsets.fromLTRB(0, 22.h, 0, 0),
               child: Stack(
                 alignment: Alignment.bottomRight,
               children: [
                 ClipOval(


                   child: Image.asset(imageUrl,

                     height: 220.h,
                     width: 270.w,
                     fit: BoxFit.cover,
                   ),
                 ),

                 Positioned(

                     left: 180.w,
                      bottom: 3.h,

                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.only(topRight: Radius.circular(22) , bottomLeft:  Radius.circular(22) )
                           ),

                           child: Row(
                             children: [
                               Icon(Icons.monetization_on_sharp),


                               Shimmer.fromColors(
                                 highlightColor: Colors.orange ,
                                 baseColor: Colors.white,
     child: Text('= 10' , style: TextStyle(fontSize: 25),
      ),
   )
                             ],
                           ),
                         ),

                     ),




               ],
               ),
             ),

      SizedBox(height: 33.h,),
          Text('ما  هو اسم الحيوان ؟' , style: TextStyle(fontSize: 33),),
          SizedBox(height: 33.h,),
         
      
  
          
        ],
      ),
    );
  }
}
