import 'package:provider/provider.dart';
import 'package:qabil_app/view_model/controller/profile_controller/profile_controller.dart';
import 'package:qabil_app/view_model/providers/corse_select_provider.dart';
import 'package:qabil_app/view_model/providers/select%20gender.dart';

import '../controller/bottom_navbar_controller/bottom_navbar_controller.dart';
import '../controller/course_select_controller/course_select_scontroller.dart';
import '../controller/icon_selecting/icon_selecting.dart';
import '../controller/image_picker/image_picker_controller.dart';
import '../controller/image_post_controller/query_post_controller.dart';
import '../controller/post_card_screen/explore_cards_controller.dart';
import '../controller/suffix_icon_controller/suffix_icon_controller.dart';

final List<ChangeNotifierProvider> multiAppProviders = [
  
  ChangeNotifierProvider<ListPractice>(create: (_) => ListPractice()),
  ///////////////////
  ChangeNotifierProvider<GenderProvider>(create: (_) => GenderProvider()),
  //////////////////////
  ChangeNotifierProvider<ImagePickerController>(
      create: (_) => ImagePickerController()),
      ////////////
  ChangeNotifierProvider<Providerc>(create: (_) => Providerc()),
  ////////////////
  ChangeNotifierProvider<SuffixIconController>(create: (_) => SuffixIconController()),
  ////////////////////
  ChangeNotifierProvider<BottomNavbarController>(create: (_) => BottomNavbarController()),
  ////////////////////////
  ChangeNotifierProvider<IconSelecting>(create: (_) => IconSelecting()),

  /////////////////////
  ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
  ///////////////////
  ChangeNotifierProvider<QueryPostController>(create: (_) => QueryPostController()),
  //////////
  ChangeNotifierProvider<ProfileController>(create: (_)=>ProfileController())
];
