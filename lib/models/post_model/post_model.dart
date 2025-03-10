import 'dart:io';

class PostModel {
  String? id;
  final String username;
  final DateTime time; 
  final String title;
  final String description;
  final List<File> images;

  PostModel({
    this.id,
    required this.username,
    required this.time, 
    required this.title,
    required this.description,
    required this.images,
  });
}
