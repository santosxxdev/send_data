import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:send_data/model/user_model.dart';
import 'package:send_data/services/firebase_manager.dart';

class Itemdata extends StatelessWidget {
  UserDataModel userDataModel;

  Itemdata({super.key, required this.userDataModel});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.green,
      elevation: 5,
      shadowColor: Colors.grey,
      child: Slidable(
        key:  ValueKey(0),
        startActionPane: ActionPane(
          motion:  DrawerMotion(),
          children:  [
            SlidableAction(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            onPressed: (context) {
              FirebaseManager.deletUser(userDataModel.id);
            },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
      
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Name: ${userDataModel.Name}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Jobs : ${userDataModel.Jobs}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Age : ${userDataModel.Age}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Phone : ${userDataModel.Phone}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
