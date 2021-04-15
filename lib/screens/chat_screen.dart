import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Application'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/SUIMhQCjzt4dCsTIJLIs/messages')
            .snapshots(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => Container(
                      padding: EdgeInsets.all(10),
                      child: Text(snapshot.data.docs[index]['text']),
                    ),
                    itemCount: snapshot.data.docs.length,
                  ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
