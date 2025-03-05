import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/post_model/post_model.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Saved")),
      body: queryController.savedPosts.isEmpty
          ? Center(child: Text("No saved posts"))
          : ListView.builder(
              itemCount: queryController.savedPosts.length,
              itemBuilder: (context, index) {
                final PostModel post = queryController.savedPosts[index];
                return PostCard(post: post);
              },
            ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final queryController =
        Provider.of<QueryController>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: post.images.isNotEmpty
                    ? Image.file(
                        post.images.first,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/default_image.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 5),
                    Text(post.description,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.comment), onPressed: () {}),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {
                            queryController.savePost(post);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
