import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';  


class activity_main extends StatelessWidget
{
  activity_main({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    
    return Scaffold(
      body: Center(
        child:Text("Hello Main Page")
      )
    );

  }


}