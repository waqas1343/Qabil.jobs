import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/controller/post_card_screen/explore_cards_controller.dart';
import '../saveScreen/saveScreen.dart';
import 'post_card/post_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SavedPostsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              final post = postProvider.posts[index];
              return PostCard(
                post: post,
                isSaved: postProvider.isPostSaved(post),
                onSave: () => postProvider.toggleSavePost(post),
              );
            },
          );
        },
      ),
    );
  }
}
