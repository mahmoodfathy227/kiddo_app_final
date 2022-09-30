import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get/get_core/src/get_main.dart';
import '../../../buisiness logic/Register Controller.dart';
import '../../Widgets/CustomField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text);
 bool done = false;
    return SafeArea(
      child: GetBuilder<Registerontroller>(
        builder: (Registerontroller) => Scaffold(
          resizeToAvoidBottomInset: false,
          body:
          Stack(alignment: Alignment.bottomCenter, children: [
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
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 45),
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
                Text('Register' , style: TextStyle(color: Colors.blue , fontSize: 20.sp),),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0, 33.h, 0, 0),
                  child: BuildRegisterFields(),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(133.w, 0, 0, 0),
                  child: Row(

                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith((states) =>
                              Registerontroller.isUpoading ? Colors.grey :
                              Colors.red
                              )
                          ),
                          onPressed: ()   {

                            Registerontroller.isUpoading ? (){} :

                            validatingAndRegister(emailValid, Registerontroller);



                          },
                          child: Text(
                            "Register".tr(),
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )),
                      SizedBox(width: 8,),
                      ConditionalBuilder(
                          condition: Registerontroller.isUserRegistering == true,
                          builder: (context)=> SpinKitCircle(
                            size: 30,
                            color: Colors.orange,
                          ),
                          fallback: (context)=> SizedBox()
                      ),




                    ],
                  ),
                ),

              ],


            ),
          ]),
        ),




        ),

      );



  }

  void validatingAndRegister(bool emailValid, Registerontroller Registerontroller) {
       if (passwordController.text.isNotEmpty) {
      if (emailController.text.isNotEmpty) {
        if (emailValid) {
          Registerontroller.registerNewUser(
            nameController.text,
            emailController.text,
            passwordController.text,
          );

          Registerontroller.registerNewUserProperties(
            nameController.text,
            emailController.text,
            passwordController.text,
            phoneController.text,
            context
          );
        }
        else{
          Fluttertoast.showToast(
              msg: "Please Enter a Vaild Email Address",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      else{
        Fluttertoast.showToast(
            msg: "Email Must Not Be Empty",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }else {
         Fluttertoast.showToast(
             msg: "Password Must Not Be Empty",
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

  Widget BuildRegisterFields(){
          final Registerontroller registerontroller = Get.find();

          return  GetBuilder<Registerontroller>(
            builder: (Registerontroller)=>Column(
              children: [
                CustomField(
                  myInputType: TextInputType.text,
                  customController: nameController,
                  fieldIcon: Icons.person,
                  fieldText: "Name",
                  isObsecureText: false,
                  ispassword: false,
                ),
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
                CustomField(
                  myInputType: TextInputType.phone,
                  customController: phoneController,
                  fieldIcon: Icons.phone_android,
                  fieldText: "Phone",
                  isObsecureText: false,
                  ispassword: false,
                ),
                Padding(
                padding: EdgeInsets.fromLTRB(22.w, 0, 0, 0),
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        Registerontroller.getImageFromGallery();

                      },
                          child: Row(
                            children: [
                              Text('Upload photo'),
                              SizedBox(width: 5.w,),
                              Icon(Icons.photo),
                            ],
                          )
                      ),
                      SizedBox(width: 15,),
                      ConditionalBuilder(
                        condition: Registerontroller.isUpoading,
                        builder: (context) => SpinKitCircle(
                          color: Color(0xFFFE642E),
                          size: 30.0,
                        ) ,
                        fallback:  (context) => Icon(Icons.photo) ,

                      ),



                    ],
                  ),
                )
              ],
            ),

          );
    }




  void loginLettersValidator(bool emailValid, BuildContext context) {

  }
}
