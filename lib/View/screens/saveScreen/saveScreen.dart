import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/View/screens/exploreScreen/post_card/post_card.dart';

import '../../../view_model/controller/post_card_screen/explore_cards_controller.dart';

class SavedPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
        centerTitle: true,
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            itemCount: postProvider.savedPosts.length,
            itemBuilder: (context, index) {
              final post = postProvider.savedPosts[index];
              return PostCard(
                post: post,
                isSaved: true,
                onSave: () => postProvider.toggleSavePost(post),
              );
            },
          );
        },
      ),
    );
  }
}
