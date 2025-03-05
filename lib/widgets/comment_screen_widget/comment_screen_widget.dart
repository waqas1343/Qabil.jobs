import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/custom_textfield/custom_textield.dart';
import 'package:qabil_project01_final/view_model/controller/comment_controller/comment_controller.dart';
import 'package:qabil_project01_final/widgets/comment_widget/comment_widget.dart';

class CommentScreen extends StatelessWidget {
  final String postId; 
  const CommentScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => CommentBottomSheet(postId: postId),
            );
          },
          child: Text("Show Comments"),
        ),
      ),
    );
  }
}


class CommentBottomSheet extends StatelessWidget {
  final String postId;
  const CommentBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentController>(context);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6, 
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController, 
                  itemCount: commentProvider.commentsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomComment(
                          commentData: commentProvider.commentsList[index],
                          commentIndex: index,
                          onReply: () {
                            commentProvider.showReply(index);
                          },
                        ),
                        if (commentProvider.replyIndex == index)
                          AppTextFields.customTextField(
                            hintText: "Reply",
                            controller: commentProvider.replyController,
                            borderRadius: 14,
                            suffixIcon: IconButton(
                              onPressed: () {
                                commentProvider.addReply(index, "username",
                                    commentProvider.replyController.text);
                                commentProvider.replyController.clear();
                              },
                              icon: Icon(Icons.send),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextFields.customTextField(
                  hintText: "Add a Comment",
                  controller: commentProvider.commentController,
                  borderRadius: 14,
                  suffixIcon: IconButton(
                    onPressed: () {
                      commentProvider.addComment(
                          "username", commentProvider.commentController.text);
                      commentProvider.commentController.clear();
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
