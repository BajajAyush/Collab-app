import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:productivityapp/helper/authenticate.dart';
import 'package:productivityapp/helper/constants.dart';
import 'package:productivityapp/helper/helperfunctions.dart';
import 'package:productivityapp/services/auth.dart';
import 'package:productivityapp/services/database.dart';
import 'package:productivityapp/views/DashboardScreen.dart';
import 'package:productivityapp/views/animation/FadeAnimation.dart';
import 'package:productivityapp/views/createTeams.dart';
import 'package:productivityapp/views/search.dart';

class Teams_detailed_view extends StatefulWidget {
  @override
  _Teams_detailed_viewState createState() => _Teams_detailed_viewState();
}

class _Teams_detailed_viewState extends State<Teams_detailed_view> {
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline),color: Colors.blueGrey,)
        ],
        title: Text(Constants.TeamName,style: TextStyle(fontSize: 20,color: Colors.black),),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
            1.3,Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(
                spacing:20,
                runSpacing: 20.0,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                    child: SizedBox(
                      width:155.0,
                      height: 160.0,
                      child: Card(

                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/todo.png",width: 54.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "TODO List",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),

                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/message.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Chat",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0

                                    ),
                                  ),

                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ),


                  Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: SizedBox(
                        width:160.0,
                        height: 160.0,
                        child: Card(

                          color: Color.fromARGB(255,21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child:Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/video-call.png",width: 64.0,),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Meeting",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),
                                    ),

                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),

          ),

          FadeAnimation(1.0,
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeAnimation(1.2, Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover
                      )
                  ),
                )),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
