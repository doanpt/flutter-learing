import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talk/widgets/message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Application'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          DropdownButton(
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
          ],
        ),
      ),
      // StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/SUIMhQCjzt4dCsTIJLIs/messages')
      //       .snapshots(),
      //   builder: (ctx, snapshot) =>
      //       snapshot.connectionState == ConnectionState.waiting
      //           ? Center(
      //               child: CircularProgressIndicator(),
      //             )
      //           : ListView.builder(
      //               itemBuilder: (ctx, index) => Container(
      //                 padding: EdgeInsets.all(10),
      //                 child: Text(snapshot.data.docs[index]['text']),
      //               ),
      //               itemCount: snapshot.data.docs.length,
      //             ),
      // ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/SUIMhQCjzt4dCsTIJLIs/messages')
                .add({'text': "This is added by floating button"});
          }),
    );
  }
}
