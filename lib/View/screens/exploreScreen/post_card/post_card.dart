import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qabil_app/constant/app_colours/appcolors.dart';

import '../../../../view_model/controller/curser_slider/curser_slider.dart';
import '../tab_card/tab_card_screen.dart';

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

  final List<String> images1 = [
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
    'assets/images/profileimage.png',
  ];

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<CurserSlider>(context);

    final savedPostsProvider = Provider.of<SavedCardProvider>(context);
    bool isSaved = savedPostsProvider.isSaved(post);

    return Card(
      color: AppColors.appBackground,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(
                  post: post,
                  images: images1,
                  onSave: () {},
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        post['time']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                overflow: TextOverflow.ellipsis,
                post['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: CarouselSlider(
                  items: images1.map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        width: double.infinity,

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
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      provider.setCurserValue(index);
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images1.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.curserValue == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    post['likes']!,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(width: 20),
                  const Icon(Icons.comment, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    post['comments']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.blue : Colors.grey,
                    ),
                    onPressed: onSave,
                  ),
                ],
              ),
            ],
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
