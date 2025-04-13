import 'package:flutter/material.dart';
import 'package:qabil_project01_final/models/post_model/post_model.dart';
import 'package:qabil_project01_final/widgets/post_card_widget/post_card_widget.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Detail")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: PostCard(
          post: post,
          isDetail: true,
        ),
      ),
    );
  }
}
