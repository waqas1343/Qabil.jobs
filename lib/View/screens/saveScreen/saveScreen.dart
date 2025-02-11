import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/controller/post_card_screen/explore_cards_controller.dart';
import '../exploreScreen/post_card/post_card.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: provider.savedPosts.length,
        itemBuilder: (context, index) {
          final post = provider.savedPosts[index];
          return PostCard(
            post: post,
            isSaved: true,
            onSave: () => provider.toggleSavePost(post),
          );
        },
      ),
    );
  }
}
