import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/post_model/post_model.dart';

class QueryController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<PostModel> savedPosts = [];
  List<File> imagesList = [];
  List<PostModel> posts = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    imagesList.addAll(pickedFiles.map((file) => File(file.path)));
    notifyListeners();
  }

  void removeImage(int index) {
    imagesList.removeAt(index);
    notifyListeners();
  }

  void uploadPost() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      return;
    }

    final newPost = PostModel(
      username: "User Name",
      time: DateTime.now().toString(),
      title: titleController.text,
      description: descriptionController.text,
      images: List.from(imagesList),
    );

    posts.insert(0, newPost);

    titleController.clear();
    descriptionController.clear();
    imagesList.clear();
    notifyListeners();
  }
  void savePost(PostModel post) {
  if (!savedPosts.contains(post)) {
    savedPosts.add(post);
    notifyListeners();
  }
}

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
