import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/controller/controller.dart';


class CustomLogoCategory extends StatelessWidget {
  const CustomLogoCategory(
      {super.key,
      required this.title,
      required this.image,
      required this.index});

  final String title;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    value.isSelected(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.3),
                    child: Column(
                      children: [
                        Container(
                            height: value.iconSelect == index ? 80 : 65,
                            width: value.iconSelect == index ? 80 : 65,
                            decoration: BoxDecoration(
                               
                              borderRadius: BorderRadius.circular(50),

                              border: Border.all(
                                  color: value.iconSelect == index
                                      ? Colors.green
                                      : Colors.blueGrey,
                                  width: value.iconSelect == index ? 3 : 1.3),
                            ),
                            child: Center(
                              child: Image.asset(
                                image,
                                height: value.iconSelect == index ? 70 : 60,
                                width: value.iconSelect == index ? 70 : 60,
                                fit: BoxFit.cover,
                              ),
                            )),
                        const SizedBox(
                          height: 2,
                        ),
                        Visibility(
                          visible: value.iconSelect == index ? false : true,
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
