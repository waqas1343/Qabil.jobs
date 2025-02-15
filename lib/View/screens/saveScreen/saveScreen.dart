import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/view_model/controller/save_card_controller/saveCard.dart';
import 'package:qabil_app/widgets/customSaveCard/custom_save_card.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedPosts = Provider.of<SavedCardProvider>(context).savedPosts;
    // final savedPosts = SavedCardProvider().savedPosts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
        centerTitle: true,
      ),
      body: savedPosts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark, size: 50, color: Colors.grey),
                  const Text("No saved posts yet!"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: savedPosts.length,
              itemBuilder: (context, index) {
                return CustomSaveCard(
                  imageUrl: savedPosts[index]['image']!,
                  description: savedPosts[index]['title']!,
                  post: savedPosts[index],
                );
              },
            ),
    );
  }
}
