import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class activity_post_state extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>activity_post();

}


class activity_post extends State<activity_post_state>
{
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child:Text("Post Page")
      ),
    );
  }
  
}
