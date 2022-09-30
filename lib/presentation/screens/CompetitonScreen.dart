import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
class Competition extends StatelessWidget {
  const Competition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
            height: 220,
            width: 190 ,
            top: 2,
            left: 90,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
            Stack(
              alignment: Alignment.bottomCenter,
            fit:  StackFit.expand,
            children: [

              Image.asset('assets/frameGIF.gif',),

              Shimmer.fromColors(
                highlightColor: Colors.amberAccent,
                  baseColor: Colors.black45,
                  child: Text('1st Place 👑' , style: TextStyle(fontSize: 33 ),))
            ],
            ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(88),
                      image: DecorationImage(
                          image: AssetImage('assets/onboardingscreeen2.png')
                      )
                  ),

                ),

              ],
            )),

        Positioned(
            height: 220,
            width: 190 ,
            top: 230,
            left: 190,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  fit:  StackFit.expand,
                 children: [
                   Image.asset('assets/frameGIF.gif',),
                   Shimmer.fromColors(
                       highlightColor: Colors.black12,
                       baseColor: Colors.black45,
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(33.w, 0, 0, 0),
                         child: Text('2nd Place 👑' , style: TextStyle(fontSize: 22 ),),
                       ))
                 ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(88),
                      image: DecorationImage(
                          image: AssetImage('assets/png2.png')
                      )
                  ),

                ),

              ],
            )),
        Positioned(
            height: 220,
            width: 190 ,
            top: 230,
            right: 190,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  fit:  StackFit.expand,
                  children: [
                    Image.asset('assets/frameGIF.gif',),
                    Shimmer.fromColors(
                        highlightColor: Color(0xffCD7F32),
                        baseColor: Colors.black45,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(33.w, 0, 0, 0),
                          child: Text('3rd Place 👑' , style: TextStyle(fontSize: 22 ),),
                        ))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(88),
                      image: DecorationImage(
                          image: AssetImage('assets/png3.png')
                      )
                  ),

                ),

              ],
            )),

      ]
    );
  }
}
