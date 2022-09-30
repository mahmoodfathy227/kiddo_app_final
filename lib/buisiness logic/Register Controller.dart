import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:page_transition/page_transition.dart';
import 'package:shipping_app/presentation/screens/Authentication/login_screen.dart';
class Registerontroller extends GetxController{
  var finalImage;
  var downloadedImageUrl;
  var your_score = 0;
  bool isUpoading = false;
  bool isUserRegistering = false;

  @override
  void onInit() {
    super.onInit();

  }



  Future <void> getImageFromGallery()async {
    final imagePicked = await ImagePicker().pickImage(source:  ImageSource.gallery);
    if(imagePicked == null){
      Fluttertoast.showToast(
          msg: "Please Pick an Image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else {
      final ImageTemporary = File(imagePicked.path);
      finalImage = ImageTemporary;
      getUploadedImageFromFirebaseStorage();
    }

  }
  Future <void> getUploadedImageFromFirebaseStorage() async{
    isUpoading = true;

    update();
    print(isUpoading);
    Future.delayed(Duration(seconds: 6) ,
            () async{
          await FirebaseStorage.instance.ref().child('UserPhotos/${Uri.file(finalImage.toString()).pathSegments.last}' + DateTime.now().toString())
              .putFile(finalImage).then((p0) {

            p0.ref.getDownloadURL().then((value) => {


              downloadedImageUrl = value,

              print('i uploaded User Photo to Firebase'),
              isUpoading = false,
            update(),
            print(isUpoading)
            });
          }

          );



        });
  }
  Future <void> registerNewUser(String name , String email ,String password ) async{
    isUserRegistering = true;
    update();
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print('done registering a new user');

  }
  Future <void> registerNewUserProperties (
      String name,
      String email,
      String password,
      String phone,
BuildContext context,
      ) async{
    FirebaseFirestore.instance.collection('${name}').doc('Details').set({

      "name" : name,
      "email" : email,
      "password" : password,
      "phone" : phone,
      "imageUrl" : downloadedImageUrl,
      "your score" : your_score,

    });
   await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    isUserRegistering =  false;
    update();
    Fluttertoast.showToast(
        msg: "Registerd Succefully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.deepOrange,
        fontSize: 16.0);
    Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginScreen()));
    print('done registering a new user properties');

  }
}