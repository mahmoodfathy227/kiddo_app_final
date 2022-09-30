import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipping_app/buisiness%20logic/Login%20Controller.dart';
import 'package:shipping_app/buisiness%20logic/UserInfo%20Controller.dart';
import 'package:shipping_app/presentation/screens/Authentication/Register%20Screen.dart';
import 'package:shipping_app/presentation/screens/Simple%20loading%20Screen.dart';
import 'package:shipping_app/presentation/screens/home_screen.dart';
import 'package:shipping_app/presentation/screens/introduction_screen.dart';
import 'package:shipping_app/presentation/screens/Authentication/login_screen.dart';
import 'buisiness logic/Register Controller.dart';
import 'constants.dart';


dynamic isloggedin = false;
dynamic isFirstTime = true;
Widget choosenScreen = Container();
Future<bool> loggedinChecker() async{
  isloggedin =  await prefs.getBool('loggedin');
  if(isloggedin != null){
    print('القيمة تم استعدعائها');
    return isloggedin;
  }else{
    return isloggedin = false;
  }



}
Future <dynamic> chooseStartScreen() async {
  isFirstTime = await prefs.getBool('isFirstTime');
  print(
    'value is ${isFirstTime}'
  );

  if (isFirstTime == true) {
    print(
        'value is ${isFirstTime}'
    );
    choosenScreen = IntroductionScreen();
  } else {
    if (isloggedin == true) {
      choosenScreen = LoadingScreen();
    }
    else {
      choosenScreen = LoginScreen();
    }
  }
}


  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();

    await chooseStartScreen();
    await prefs.setBool('isFirstTime',false);
    await loggedinChecker();
    print(isloggedin);
    await Firebase.initializeApp();

    await EasyLocalization.ensureInitialized();

    runApp(EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],

        path: 'translations',
        fallbackLocale: Locale('en'),
        child:  MyApp(CustomStartScreen: choosenScreen,)));
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.CustomStartScreen}) : super(key: key);
final Widget CustomStartScreen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Registerontroller registerontroller = Get.put(Registerontroller());
    final LoginController loginController = Get.put(LoginController());

    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () =>

            AdaptiveTheme(
              light: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
                accentColor: Colors.amber,
                textTheme: GoogleFonts.cairoTextTheme(
                ),
              ),
              dark: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.red,
                accentColor: Colors.amber,
                textTheme: GoogleFonts.cairoTextTheme(
                ),
              ),
              initial: AdaptiveThemeMode.light,

              builder: (theme, darkTheme) =>
                  ConnectivityAppWrapper(
                  app: MaterialApp(
                    title: 'Kiddo App',
                    theme: theme.copyWith(textTheme: GoogleFonts.cairoTextTheme(
                    ),
                    ),
                    darkTheme: darkTheme,
                    themeMode: ThemeMode.system,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    //... other code
                    builder: (context, widget) {

                      //add this line
                      ScreenUtil.setContext(context);
                      return MediaQuery(
                        //Setting font does not change with system font size
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                        child: widget!,
                      );
                    },
                    home:  CustomStartScreen,
                    //loggedin?  HomeScreen() : LoginScreen(),
                  ),

                ),

            ),

      );

  }
}

