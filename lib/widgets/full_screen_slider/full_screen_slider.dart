import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_project01_final/view_model/controller/image_slider_provider/image_slider_provider.dart';

class FullScreenImageSlider extends StatelessWidget {
  final List<File> images;
  final int initialIndex;

  const FullScreenImageSlider({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageSliderProvider()..setIndex(initialIndex),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<ImageSliderProvider>(
          builder: (context, sliderProvider, _) {
            final controller = PageController(initialPage: sliderProvider.currentIndex);

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: controller,
                  itemCount: images.length,
                  onPageChanged: (index) => sliderProvider.setIndex(index),
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.file(
                        images[index],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "${sliderProvider.currentIndex + 1} / ${images.length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
