import 'dart:async';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';  
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sorapp.ir/activity_post.dart';




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
  List<Widget> Menu_Panels=[];



  //Iniilazeing Start
  @override
  void initState() 
  {
    super.initState();
    GetLoadAllPosts();

    //Get All Panels Start
    Menu_Panels.add(Search_Widget());
    Menu_Panels.add(Profile_Widget());
    //Get All Panels End
  }
  //Iniilazeing End 



  //Main function Start
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child:Menu_Panels.elementAt(select_menu_item)
        // child:All_Posts_Widget()
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



  //On Click Menu Item Start
  void OnClick_All_Posts_Item(int position)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> activity_post_state()));
    debugPrint("Click "+position.toString());
  }
  //On Click Menu Item End



  // Get Load All Posts Start
  Future<void> GetLoadAllPosts() async
  {
    var response=await http.get(Uri.parse('https://rezafarazi.github.io/Online_Json_Api/sorapp.json'));

    setState(() 
    {
      all_posts=jsonDecode(response.body);
      Menu_Panels.insert(0,Home_Widget());
    });
    
  }
  // Get Load All Posts End



  //Home Widget Start
  Widget Home_Widget()
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
            onPressed: ()=>{
              OnClick_All_Posts_Item(position)
            },
            child: Text(all_posts[position]['Title'],
            textAlign: TextAlign.center,),
          ),
        );
      },
    );
  }
  //Home Widget End



  //Search Widget Start
  Widget Search_Widget() {
    return Text("Search");
  }
  //Search Widget End



  //Profile Widget Start
  Widget Profile_Widget() {
    return Text("Profile");
  }
  //Profile Widget End


}
//Main Class End
