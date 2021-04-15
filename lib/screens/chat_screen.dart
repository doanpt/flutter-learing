import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Application'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(10),
          child: Text('Chat message '),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/SUIMhQCjzt4dCsTIJLIs/messages')
              .snapshots().listen((data) {
                print(data.docs[0]['text']);
          });
        },
      ),
    );
  }
}
