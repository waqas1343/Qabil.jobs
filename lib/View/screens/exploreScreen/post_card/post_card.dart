import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/view_model/controller/save_card_controller/saveCard.dart';

class PostCard extends StatelessWidget {
  final Map<String, String> post;
  final bool isSaved;
  final VoidCallback onSave;

  PostCard({
    super.key,
    required this.post,
    required this.isSaved,
    required this.onSave,
  });

  final List<String> images = [
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final savedPostsProvider = Provider.of<SavedCardProvider>(context);
    bool isSaved = savedPostsProvider.isSaved(post);
    return Card(
      color: AppColors.appBackground,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Row
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(post['image']!),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      post['time']!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Title
            Text(
              post['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: 250,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Like, Comment, Save Row
            Row(
              children: [
                const Icon(Icons.thumb_up, size: 28, color: AppColors.textColorGrey),
                const SizedBox(width: 5),
                Text(
                  post['likes']!,
                  style: const TextStyle(color: AppColors.textColorGrey,fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.comment, size: 28, color: AppColors.textColorGrey),
                const SizedBox(width: 5),
                Text(
                  post['comments']!,
                  style: const TextStyle(color: AppColors.textColorGrey,fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.blue : AppColors.textColorGrey,
                    size: 33,
                  ),
                  onPressed: () {
                    savedPostsProvider.toggleSavePost(post);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
