import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get/get_core/src/get_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shipping_app/presentation/screens/Authentication/Register%20Screen.dart';
import 'package:shipping_app/presentation/screens/Simple%20loading%20Screen.dart';
import 'package:shipping_app/presentation/screens/home_screen.dart';

import '../../../buisiness logic/Login Controller.dart';
import '../../../constants.dart';
import '../../Widgets/CustomField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    final LoginController loginController = Get.find();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: fullWidth,
            height: fullHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/logintest2.png',
              ),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 35),
              child: Row(
                children: [
                  BuildlanguageController(),
                  Spacer(),
                  BuildThemeController()
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('LoginHeder'.tr() , style: TextStyle(fontSize: 25 , color: Colors.blue , letterSpacing: 2),),
              SizedBox(height: 12,),
              BuildLoginFields(),
              SizedBox(
                height: 32.h,
              ),
              GetBuilder<LoginController>(
                builder: (LoginController) =>  Padding(
                  padding: EdgeInsets.fromLTRB(150.w, 0, 0, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {

                              loginValidationAndChecker(emailValid, LoginController, context);







                          },
                          child: Text(
                            "login".tr(),
                            style: TextStyle(),
                          )),
                      SizedBox(width: 33.w,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RegisterScreen())
                          );
                        },
                          child: Text('Register' , style: TextStyle(color: Colors.blue , fontSize: 15.sp),))
                    ],
                  ),
                ),

              )
            ],
          ),
        ]),
      ),
    );
  }

  void loginValidationAndChecker(bool emailValid, LoginController LoginController, BuildContext context) {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty &&  emailValid) {
      LoginController.login(context, emailController.text, passwordController.text);

    } else {
      Fluttertoast.showToast(
          msg: "Please Check your info",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }



  Widget BuildlanguageController() {
    return Row(
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                    states == MaterialState.pressed
                        ? Color(0xffCFF152)
                        : Colors.blueGrey)),
            onPressed: () async {
              await context.setLocale(
                Locale('ar'),
              );
            },
            child: Text('AR'),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: 55.h,
          width: 55.w,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                    states == MaterialState.pressed
                        ? Color(0xffCFF152)
                        : Color(0xffCFF152))),
            onPressed: () async {
              await context.setLocale(
                Locale('en'),
              );
            },
            child: Text(
              'En',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }

  Widget BuildThemeController() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              AdaptiveTheme.of(context).setDark();
            },
            icon: Icon(
              Icons.brightness_2,
              color: Colors.black87,
            )),
        IconButton(
            onPressed: () {
              AdaptiveTheme.of(context).setLight();
            },
            icon: Icon(
              Icons.brightness_4_outlined,
              color: Colors.deepOrange,
            )),
      ],
    );
  }

  Widget BuildLoginFields() {
    return Column(
      children: [
        CustomField(
          myInputType: TextInputType.emailAddress,
          customController: emailController,
          fieldIcon: Icons.email,
          fieldText: "email".tr(),
          isObsecureText: false,
          ispassword: false,
        ),
        CustomField(
          myInputType: TextInputType.visiblePassword,
          customController: passwordController,
          fieldIcon: Icons.key,
          fieldText: "password".tr(),
          isObsecureText: true,
          ispassword: true,
        ),
      ],
    );
  }
}
