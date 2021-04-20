import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String _message;
  final bool _isMe;
  final Key key;
  final String _username;
  final String _avatar;

  MessageBubble(this._username, this._message, this._avatar, this._isMe,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: _isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: _isMe ? Radius.circular(12) : Radius.circular(0),
                  bottomRight: _isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              width: 140,
              margin: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: this._isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    this._username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.title.color),
                  ),
                  Text(
                    _message,
                    style: TextStyle(
                        color: _isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.title.color),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          right: _isMe ? 0 : 80,
          left: _isMe ? 80 : 0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(_avatar),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
