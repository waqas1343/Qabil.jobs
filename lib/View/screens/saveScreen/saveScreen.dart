import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';
import 'package:qabil_app/constant/custom_text/custom_text.dart';
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
        title: const Text('Saved Posts',
        style: TextStyle(
          color: AppColors.appBackground,
        ),),
        actions: [
          Icon(Icons.notifications_none_rounded,
            color: AppColors.appBackground ,
            size: 25,
          ),
          SizedBox(width: 8,),

          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(AppImages.profileImage),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.textColor,
      ),
      // body: savedPosts.isEmpty
      //     ? Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.bookmark_outline, size: 120, color: Colors.grey),
      //             CustomText(text: 'No saved posts yet!'),
      //           ],
      //         ),
      //       )
          body : ListView.builder(
              itemCount: savedPosts.length,
              itemBuilder: (context, index) {
                return CustomSaveCard(
                  imageUrl: savedPosts[index]['image']!,
                  description: savedPosts[index]['title']!,
                  title: savedPosts[index] ['name']!,
                  post: savedPosts[index],
                );
              },
            ),
    );
  }
}
