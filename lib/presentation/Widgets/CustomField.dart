import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatefulWidget {
   CustomField({Key? key, required this.fieldText, required this.fieldIcon, required this.isObsecureText, required this.ispassword, required this.customController,  required this.myInputType}) : super(key: key);
  final String fieldText;
  final IconData fieldIcon;
    bool isObsecureText;
  final bool ispassword;
   final TextInputType  myInputType ;
final  TextEditingController customController;


  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {


  late FocusNode focusNode;

  void initState() {
    focusNode = new FocusNode();

    // listen to focus changes
    focusNode.addListener(() => print('focusNode updated: hasFocus: ${focusNode.hasFocus}'));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: 95.h,
      child: TextField(
        textDirection: TextDirection.rtl,
        focusNode: focusNode ,
        keyboardType: widget.myInputType ,
        obscureText: widget.isObsecureText,

        controller: widget.customController,
        decoration: InputDecoration(
            suffixIcon: widget.ispassword? GestureDetector(
              onTap: (){
                widget.isObsecureText =! widget.isObsecureText;
                setState(() {

                });
              },
              child: Icon( widget.isObsecureText ?Icons.visibility : Icons.visibility_off),
            ): SizedBox() ,
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(55),

            ),
            labelText: widget.fieldText,
            icon: Icon( widget.fieldIcon),
            iconColor: Colors.grey,
            fillColor:  Color(0xffF7F4D5),
            isDense: true

        ),
      ),
    );
  }
}



