import 'package:flutter/material.dart';

class CustomComment extends StatelessWidget {
  final Map<String, dynamic> commentData;
  final int commentIndex;
  final VoidCallback onReply;

  CustomComment({
    required this.commentData,
    required this.commentIndex,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage("assets/images/profileimage.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(commentData["username"],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(commentData["comment"]),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(commentData["time"],
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: onReply,
                        child: Text("Reply",
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ),
                      Spacer(),
                      Icon(Icons.favorite_border, size: 20),
                    ],
                  ),
                  if (commentData.containsKey("replies") &&
                      commentData["replies"].isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        children: commentData["replies"]
                            .map<Widget>((reply) => CustomComment(
                                  commentData: reply,
                                  commentIndex: commentIndex,
                                  onReply: () {},
                                ))
                            .toList(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
