import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Color generalColor = Colors.white;
ButtonStyle myCustomButtonSettings = ButtonStyle(

fixedSize: MaterialStateProperty.resolveWith((states) {
if(states.contains(MaterialState.pressed)){
return  Size(66.w, 55.h);
}
else{
return  Size(110.w, 55.h);
}

}),
);
late final prefs ;