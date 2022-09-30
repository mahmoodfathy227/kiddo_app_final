import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class DeveloperContact extends StatelessWidget {
  const DeveloperContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 0, 0, 0),
          child: Text('تواصل مع المطور لطلب اعمال' , style: TextStyle(fontSize: 19.sp),),
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
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email : mahmoodfathy246@gmail.com",
              style: TextStyle(fontSize: 17.sp,
              color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {

                  Clipboard.setData(ClipboardData(text: "mahmoodfathy246@gmail.com"));
                  Fluttertoast.showToast(
                      msg: "Email Copied !",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                },
                child: Text(
                  "Copy Email",
                  style: TextStyle(),
                )),
            Text("Whatsapp : +201066293631",
              style: TextStyle(fontSize: 17.sp,
              color: Colors.green
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {

                  Clipboard.setData(ClipboardData(text: "+201066293631"));
                  Fluttertoast.showToast(
                      msg: "Number Copied!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                },
                child: Text(
                  "Copy Number",
                  style: TextStyle(),
                )),
          ],
        ),
      ),
    );
  }
}
