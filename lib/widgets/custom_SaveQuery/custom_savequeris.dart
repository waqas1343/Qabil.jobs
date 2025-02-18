import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
//import 'package:qabil_app/view_model/providers/generalProvider.dart';

class CustomSaveQuery extends StatelessWidget {
  const CustomSaveQuery({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Consumer(
          builder: (context, value, child) {
            return Container(
             height: 170,
              width: 470,
              decoration: BoxDecoration(
                color: AppColors.appBackground,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(2, 4),
                    color: AppColors.textColorGrey.withOpacity(0.7),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.textColor,
                        ),
                        child: Image.asset(AppLogo.htmlCss,
                        height: 40,
                        width: 100,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text("I'm flutter developer"
                          "I'M FLUTTER DEVEL"
                          "I'm flutter ,my problem"
                          "I'M FLUTTER DEVEL"
                        "I'M FLUTTER DEVEL"
                        ,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),),

                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                            //  value.likeSelected(index);
                              print("object");
                            },
                            child: Icon(
                               // value.isLike(index)
                                    Icons.favorite_outline_outlined
                                    //: Icons.favorite_rounded,
                                , color: AppColors.textColor),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.messenger_outline),
                          SizedBox(
                            width: 230,
                          ),
                          GestureDetector(
                            onTap: () {
                             // value.saveSelected(index);
                              print("object");
                            },
                            child: Icon(Icons.bookmark,
                               // color: value.isSave(index)
                                    color:AppColors.textColor
                                    //: AppColors.textColorGrey),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
