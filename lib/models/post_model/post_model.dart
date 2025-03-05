import 'dart:io';

class PostModel {
  String? id;  // Optional ID
  final String username;
  final String time;
  final String title;
  final String description;
  final List<File> images;

  PostModel({
    this.id, // Optional ID
    required this.username,
    required this.time,
    required this.title,
    required this.description,
    required this.images,
  });
}
