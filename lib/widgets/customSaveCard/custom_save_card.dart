import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/view_model/controller/save_card_controller/saveCard.dart';

class CustomSaveCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final Map<String, String> post;
  const CustomSaveCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.post,
  });
  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedCardProvider>(context);
    bool isSaved = savedProvider.isSaved(post);
    return Card(
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
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_outline),
                        onPressed: () {},
                      ),
                      Spacer(),
                      IconButton(
                        icon: isSaved
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_border),
                        color: isSaved ? Colors.blue : Colors.grey,
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
    );
  }
}
