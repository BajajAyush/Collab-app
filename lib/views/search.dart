
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivityapp/services/database.dart';
import 'package:productivityapp/views/animation/FadeAnimation.dart';

import 'animation/animated_button.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  TextEditingController SearchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapsot;

  initiateSearch(){
    dataBaseMethods.getUserByUsername(SearchTextEditingController.text)
        .then((val){
      setState(() {
        searchSnapsot = val;
      });

    });
  }


  Widget searchList(){
    return searchSnapsot != null ? Expanded(
      child: ListView.builder(
          itemCount:searchSnapsot.documents.length ,
          shrinkWrap: true,

          itemBuilder: (context,index){

            return SearchTile(
              userName: searchSnapsot.documents[index].data["name"],
              userEmail: searchSnapsot.documents[index].data["email"],
            ) ;
          }),
    ) : Container();
  }
  @override
  void initState() {

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.blueGrey),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.blueGrey,),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8.0),
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),

                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),

                child: Row(
                  children: <Widget>[
                      Expanded(
                          child: TextField(
                            controller: SearchTextEditingController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                            hintText: "username",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: (){

                                  initiateSearch();

                              },
                              child: Icon(Icons.search,color: Colors.white,),
                          ),
                        ),

                        ),

                  ],

                ),
              ),
            ),
            SizedBox(height: 5,),
            searchList()
          ],
        ),
      ),
    );
  }
}
class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName,this.userEmail});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(1.3,
      Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName, style: TextStyle(fontSize: 15.0,color: Colors.white),),
                  Text(userEmail,style: TextStyle(fontSize: 15.0,color: Colors.white),)

                ],
              ),
              Spacer(),
              AnimatedButton(
                onTap: () {
                  //TODO:print("animated button pressed");

                },
                animationDuration: const Duration(milliseconds: 2000),
                initialText: "Confirm",
                finalText: "",
                iconData: Icons.check,
                iconSize: 26.0,
                buttonStyle: ButtonStyle(
                  primaryColor: Colors.white,
                  secondaryColor: Colors.white,
                  buttoncolor: Colors.blue,
                  elevation: 5.0,
                  initialTextStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                  finalTextStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                  borderRadius: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
