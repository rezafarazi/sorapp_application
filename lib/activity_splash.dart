import 'dart:async';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sorapp.ir/activity_main.dart';  


class activity_splash extends StatelessWidget
{

  //Constractor
  activity_splash({Key? key}):super(key: key);



  //On Initalize Start
  void Initalize(BuildContext context){

    var timer_counter=0;

    Timer t=new Timer.periodic(new Duration(seconds:1), (timer) { 

      timer_counter++;
      if(timer_counter>=3)
      {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> activity_main()));
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> activity_main_state()),(Route<dynamic> route)=>false);
        timer.cancel();
      }

    });

  }
  //On Initalize End



  //Main Tree Start
  @override
  Widget build(BuildContext context) 
  {
    
    Initalize(context);

    return Scaffold(
      body: Center(
        child:Center(
          child: Image(image: AssetImage('assets/logo.png'),height:90,width:90),
        )
        
      )
    );
  }
  //Main Tree End

}