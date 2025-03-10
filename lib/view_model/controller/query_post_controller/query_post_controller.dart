import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/post_model/post_model.dart';

class QueryController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<PostModel> posts = [];
  List<File> imagesList = [];
  List<PostModel> savedPosts = [];

  Future<void> pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      imagesList.addAll(pickedFiles.map((file) => File(file.path)));
      notifyListeners();
    }
  }

  void removeImage(int index) {
    imagesList.removeAt(index);
    notifyListeners();
  }

  void uploadPost(BuildContext context) {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Title aur Description zaroori hain!")),
      );
      return;
    }

    final newPost = PostModel(
      username: "User Name",
      time: DateTime.now(),
      title: titleController.text,
      description: descriptionController.text,
      images: List.from(imagesList),
    );

    posts.insert(0, newPost);

    // Fields clear karna
    titleController.clear();
    descriptionController.clear();
    imagesList.clear();

    notifyListeners();

    // ✅ Bottom Sheet close karna
    Navigator.pop(context);
  }

  void savePost(PostModel post) {
    if (savedPosts.contains(post)) {
      savedPosts.remove(post);
    } else {
      savedPosts.add(post);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
