import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';  
import 'package:http/http.dart' as http;
import 'dart:convert';




//State Class Start
class activity_main_state extends StatefulWidget
{
  @override
  activity_main createState()=>activity_main();

}
//State Class End


// class js
// {
//   final String id;
//   final String Title;
//   final String Image;
  
//   js(this.id,this.Title,this.Image);

//   js.fromJson(Map<String,dynamic> json):id=json['id'],Title=json['Title'],Image=json['Image'];
//   Map<String,dynamic> toJson()=>{
//     'id':id,
//     'Title':Title,
//     'Image':Image,
//   };

// }



//Main Class Start
class activity_main extends State<activity_main_state>
{

  //Global Variables
  int select_menu_item=0;
  List all_posts=[];


  //Panels Start
  List<Widget> Menu_Panels=[];
  //Panels End



  @override
  void initState() 
  {
    super.initState();
    GetLoadAllPosts();

    //Get All Panels Start
    Menu_Panels.add(All_Posts_Widget());
    Menu_Panels.add(All_Posts_Widget());
    Menu_Panels.add(All_Posts_Widget());
    //Get All Panels End
  }


  //Main function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        // child:Menu_Panels.elementAt(select_menu_item)
        child:All_Posts_Widget()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:
          <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "خانه"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "جست و جو"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "دسته بندی ها"
            )
          ],
          currentIndex: select_menu_item,
          selectedItemColor: Color(0xFFed555a),
          onTap: GetOn_Menu_Change,
      ),
    );

  }
  //Main function End



  //Bottom Navigation Bar Events Start
  void GetOn_Menu_Change(int index)
  {

    setState(() 
    {
      select_menu_item = index;
    });
    
  }
  //Bottom Navigation Bar Events End





  Widget All_Posts_Widget()
  {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        mainAxisSpacing: 16
      ),
      itemCount: all_posts.length,
      itemBuilder: (BuildContext context,int position){
        // return Image.network(all_posts[position]['Image']);
        return Padding(padding: EdgeInsets.all(16.0),
        child:FlatButton(
          onPressed: OnClick_All_Posts_Item,
            child: Text(all_posts[position]['Title'],
            textAlign: TextAlign.center,),
          ),
        );
      },
    );
  }





  //On Click Menu Item Start
  void OnClick_All_Posts_Item(){
    debugPrint("Click");
  }
  //On Click Menu Item End




  
  // Get Load All Posts Start
  Future<void> GetLoadAllPosts() async
  {
    var response=await http.get(Uri.parse('https://rezafarazi.github.io/Online_Json_Api/sorapp.json'));

    setState(() 
    {
      all_posts=jsonDecode(response.body);
    });
    
  }
  // Get Load All Posts End




}
//Main Class End
