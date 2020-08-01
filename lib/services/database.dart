import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{
  getUserByUsername(String username) async{
    return await Firestore.instance.collection("users")
        .where("name" ,isEqualTo: username )
        .getDocuments();
  }
  getUserByUserEmail(String Email) async{
    return await Firestore.instance.collection("users")
        .where("email" ,isEqualTo: Email )
        .getDocuments();
  }
  getUserTeamsByEmail(String Email) async{
    return await Firestore.instance.collection("team")
        .where("users",arrayContains: Email)
        .getDocuments();
  }
  uploadUserInfo(userMap){

    Firestore.instance.collection("users").document(userMap["email"]).setData(userMap);


  }

  createTeamAndChatRoom(String team_name , teamMap){
    Firestore.instance.collection("team")
        .document(team_name).setData(teamMap).catchError((e){
      print(e.toString());
    });
  }
  addUsertoTeamAndChatRoom(String team_name,team_membersMap){
    Firestore.instance.collection("team")
        .document(team_name).setData(team_membersMap).catchError((e){print(e.toString());});
  }

}