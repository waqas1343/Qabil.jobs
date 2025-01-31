import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'name': 'Abdul Rehman Rashid',
      'time': '2 Hour ago',
      'title': 'How to change background ...Read More',
      'likes': '42K',
      'comments': '52K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Ali Ahmed',
      'time': '3 Hour ago',
      'title': 'Creating vector art ...Read More',
      'likes': '35K',
      'comments': '45K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
    {
      'name': 'Sara Khan',
      'time': '5 Hour ago',
      'title': 'UI/UX design tips ...Read More',
      'likes': '28K',
      'comments': '38K',
      'image': 'assets/images/profileimage.png',
      'postImage': 'assets/images/profileimage.png',
    },
  ];

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(post: post);
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Map<String, String> post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Text(
              post['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                post['postImage']!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
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
                Spacer(),
                const Icon(Icons.savings_sharp, size: 16, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
