import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import '../../view_model/controller/icon_selecting/icon_selecting.dart';

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
    final provider = Provider.of<IconSelecting>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                provider.isSelected(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        height: provider.iconSelect == index ? 80 : 65,
                        width: provider.iconSelect == index ? 80 : 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: provider.iconSelect == index
                                    ? AppColors.textColor
                                    : AppColors.textColorGrey,
                                width: provider.iconSelect == index ? 3 : 1.3),
                            boxShadow: [
                              BoxShadow(
                                offset: provider.iconSelect == index
                                    ? Offset(0.0, 0.0)
                                    : Offset(0.0, 0.5),
                                blurRadius:
                                    provider.iconSelect == index ? 0 : 2,
                                // spreadRadius:
                                //     provider.iconSelect == index ? 0 : 3,
                                color: AppColors.indicatorColor,
                              ),
                            ]),
                        child: Center(
                          child: Image.asset(
                            image,
                            height: provider.iconSelect == index ? 70 : 60,
                            width: provider.iconSelect == index ? 70 : 60,
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    Visibility(
                      visible: provider.iconSelect == index ? false : true,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.iconsColors,
                          fontSize: 13,
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
  }
}
