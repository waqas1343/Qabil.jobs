
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qabil_app/Navigation_screening/app_navigators.dart';
import 'package:qabil_app/constant/app_button/app_button.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import 'package:qabil_app/constant/app_images/app_images.dart';
import 'package:qabil_app/constant/custom_textfield/custom_textield.dart';
import 'package:qabil_app/routes/routes_name/routes_names.dart';
import 'package:qabil_app/widgets/logout_dialog/logout_dialog.dart';

import '../../../constant/app_sizes/app_sizes.dart';
import '../../../constant/app_strings/appstrings.dart';

import '../../../constant/custom_text/custom_text.dart';
import '../../../view_model/controller/profile_controller/profile_controller.dart';
import '../../../widgets/custom_dialogbox/custom_dialogbox.dart';
import '../../../widgets/select_Imagesource/select_image_source.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<ProfileController>(
          builder: (context, click, child) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                              AppImages.profileImage),
                          // click.image != null
                          //     ? FileImage(click.image!)
                          //     : null,
                          // child: click.image == null
                          //     ? Icon(
                          //         Icons.person,
                          //         size: 50,
                          //         color: Colors.grey[700],
                          //       )
                          //     : null,
                        ),
                        Positioned(
                          bottom: -5,
                          right: -4,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 50,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SelectImageSource(
                                          icon: Icons.add_a_photo,
                                          title: AppStrings.addaphoto,
                                          onTap: () {
                                            Navigator.pop(context);
                                            click.pickImage(ImageSource.camera);
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SelectImageSource(
                                          icon: Icons.photo_library,
                                          title: AppStrings.insertgallery,
                                          onTap: () {
                                            Navigator.pop(context);
                                            click
                                                .pickImage(ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),

                  CustomText(text: 'Name',style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(
                    height: AppSizes.height01(context),
                  ),
                  AppTextFields.customTextField(
                    readOnly: true,
                    hintText: AppStrings.nameText,
                    controller: click.nameController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogbox(
                              controller: click.editnameController,
                              onSave: () {
                                click.nameController.text =
                                    click.editnameController.text;
                              },
                              hintname: AppStrings.savebutton,
                              titlename: AppStrings.nameText,
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.height01(context),
                  ),
                  CustomText(text: 'Bio',style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(
                    height: AppSizes.height01(context),
                  ),
                  AppTextFields.customTextField(
                    readOnly: true,
                    hintText: AppStrings.bio,
                    controller: click.bioController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogbox(
                              controller: click.editbioController,
                              onSave: () {
                                click.bioController.text =
                                    click.editbioController.text;
                              },
                              hintname: AppStrings.cencalText,
                              titlename: AppStrings.bio,
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        icon: Icons.logout_outlined,
                        seperationContent: 15,
                        iconColor: AppColors.appBackground,
                        btnWidth: 150,
                        btnText: AppStrings.logoutButton,
                        color: AppColors.textColor,
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return LogoutDialog(
                                onConfirm: () {
                                  AppNavigators.outscreen(
                                      context, RouteNames.login);
                                },
                              );
                            },
                          );
                          // AppNavigators.outscreen(context, RouteNames.login);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
