import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/widgets/custom_AppBar/appbar.dart';

class MentorProfile extends StatelessWidget {
  const MentorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker pickImage = ImagePicker();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          title: "Profile",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.textColorGrey,
                  radius: 100,
                   backgroundImage: AssetImage(
                     AppLogo.figma,
                   ),
                ),
                Positioned(
                  bottom: 9,
                   right: 10,
                    child:Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                      ),
                      child: GestureDetector(
                        onTap: (){
                          print("click");

                        },
                        child: Icon(Icons.camera_alt_outlined,
                          color: AppColors.blackTextClr,
                          size: 40,
                        ),
                      ),


                    ), )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
