import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shipping_app/presentation/screens/Authentication/login_screen.dart';
import 'package:shipping_app/presentation/screens/home_screen.dart';

import '../../buisiness logic/UserInfo Controller.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    Get.put(UserInfo());
    Future.delayed(Duration(seconds: 2),
    (){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCircle(
          color: Colors.orange,
          size: 100,
        )
      ) ,
    );
  }
}
