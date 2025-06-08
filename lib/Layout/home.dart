import 'package:flutter/material.dart';
import 'package:send_data/model/user_model.dart';
import 'package:send_data/services/firebase_manager.dart';
import 'package:send_data/widget/add_user_bottom_sheet.dart';

import '../widget/ItemData.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseManager firebaseManager = FirebaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Send Data',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                showAddUserBottomSheet();
              });
            },
            child: Text('Add User Jobs'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: firebaseManager.getUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final users = snapshot.data ?? [];
                if (users.isEmpty) {
                  return Center(child: Text('No users found.'));
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Itemdata(
                      userDataModel: users[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showAddUserBottomSheet();
      }),
    );
  }

  void showAddUserBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddUserBottomSheet();
      },
    );
  }
}
