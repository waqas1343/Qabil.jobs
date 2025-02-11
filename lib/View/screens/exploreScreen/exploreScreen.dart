import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/controller/post_card_screen/explore_cards_controller.dart';
import '../saveScreen/saveScreen.dart';
import 'post_card/post_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
      body: ListView.builder(
        itemCount: provider.posts.length,
        itemBuilder: (context, index) {
          final post = provider.posts[index];
          return PostCard(
            post: post,
            isSaved: provider.isPostSaved(post),
            onSave: () => provider .toggleSavePost(post),
          );
        },
      ),
    );
  }
}
