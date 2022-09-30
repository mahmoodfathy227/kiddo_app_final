import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hw_introduction_screen/hw_introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shipping_app/presentation/screens/Authentication/login_screen.dart';

import 'home_screen.dart';
class IntroductionScreen extends StatelessWidget {
   IntroductionScreen({Key? key, pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HwIntroductionScreen(
        items:  [
          HwIntroductionItem(
              title: 'Welcome to Kiddo App', // String
              caption: 'Learn more with Kido games app that will make you smart and master of things', // String
              image: Image.asset("assets/onboardingscreen1.png") // Widget
          ),
          HwIntroductionItem(
              title: 'Much Fun', // String
              caption: 'You will not only play but also have a great experience while using the app', // String
              image: Image.asset('assets/onboardingscreeen2.png') // Widget
          ),
          HwIntroductionItem(
              title: 'Play More ,Win More', // String
              caption: 'Play More , Get More Points In Your Credit', // String
              image: Image.asset('assets/onboardingscreen3.png') // Widget
          ),

        ],
        onFinish:(){
         Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (context)=> LoginScreen()),
                 (route) => false);
        }
          )

          );
        }

  }



