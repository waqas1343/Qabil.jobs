import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/view_model/controller/save_card_controller/saveCard.dart';

class CustomSaveCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;
  final Map<String, String> post;
  const CustomSaveCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.post,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedCardProvider>(context);
    bool isSaved = savedProvider.isSaved(post);
    bool likeToggle = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: AppColors.appBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),

                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextClr
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up_off_alt_sharp,
                          color: AppColors.textColor,),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment_sharp,
                          color: AppColors.textColorGrey,),
                          onPressed: () {},
                        ),
                        Spacer(),
                        IconButton(
                          icon: isSaved
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_border),
                          color: isSaved ? AppColors.textColor : AppColors.textColorGrey,
                          onPressed: () {
                            savedProvider.toggleSavePost(post);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
