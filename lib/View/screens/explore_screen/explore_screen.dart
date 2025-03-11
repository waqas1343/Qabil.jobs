import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/constant/custom_appbar/custom_appbar.dart';

import '../../../models/post_model/post_model.dart';
import '../../../view_model/controller/query_post_controller/query_post_controller.dart';
import '../../../widgets/post_card_widget/post_card_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = Provider.of<QueryController>(context);

    return Scaffold(
      appBar: CustomAppBar(
        preSize: 50,
        centerTitle: true,
        username: 'Explore',
      ),
      body: queryController.posts.isEmpty
          ? Center(child: Text("No posts available"))
          : ListView.builder(
              itemCount: queryController.posts.length,
              itemBuilder: (context, index) {
                final PostModel post = queryController.posts[index];
                return PostCard(post: post);
              },
            ),
    );
  }
}
