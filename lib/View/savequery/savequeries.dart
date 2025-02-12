import 'package:flutter/material.dart';
import 'package:qabil_app/constant/app_colours/appcolors.dart';
import '../../widgets/custom_SaveQuery/custom_savequeris.dart';

class SaveQuery extends StatelessWidget {
  const SaveQuery({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Save",style: TextStyle(
          color: AppColors.appBackground,
        ),),
        centerTitle: true,
        backgroundColor: AppColors.textColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
              List.generate(10, (index) {
                return  CustomSaveQuery(index: index,);
              },),



          ),
        ),
      ),

    );
  }
}
