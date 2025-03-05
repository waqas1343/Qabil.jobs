import 'package:provider/provider.dart';
import 'package:qabil_project01_final/view_model/controller/bottom_roll_controller/bottom_roll_controller.dart';
import 'package:qabil_project01_final/view_model/controller/comment_controller/comment_controller.dart';
import 'package:qabil_project01_final/view_model/controller/course_selection_controller/corse_select_provider.dart';
import 'package:qabil_project01_final/view_model/controller/gender_selection_controller/gender_provider.dart';
import '../controller/all_textediting_controller/all_textediting_controller.dart';
import '../controller/bottom_navbar_controller/bottom_navbar_controller.dart';
import '../controller/icon_selector_controller/icon_selector.dart';
import '../controller/image_picker/image_picker_controller.dart';
import '../controller/like_conter_controller/like_conter.dart';
import '../controller/query_post_controller/query_post_controller.dart';
import '../controller/splash_provider/splash_screen_controller.dart';
import '../controller/suffix_icon_controller/suffix_icon_controller.dart';

final List<ChangeNotifierProvider> multiAppProviders = [
  ChangeNotifierProvider<ListPractice>(create: (_) => ListPractice()),
  ///////////////////
  ChangeNotifierProvider<GenderProvider>(create: (_) => GenderProvider()),
  //////////////////////
  ChangeNotifierProvider<ImagePickerController>(
      create: (_) => ImagePickerController()),
  ////////////
  ChangeNotifierProvider<SuffixIconController>(
      create: (_) => SuffixIconController()),
  ////////////////////
  ChangeNotifierProvider<BottomNavbarController>(
      create: (_) => BottomNavbarController()),

  ///////////////////////////
  ChangeNotifierProvider<SplashScreenController>(
      create: (_) => SplashScreenController()),
  //////////////////
  ChangeNotifierProvider<TextEditingControllerManager>(
      create: (_) => TextEditingControllerManager()),
  ///////////////////////////
  ChangeNotifierProvider<QueryController>(create: (_) => QueryController()),

  ChangeNotifierProvider<IconSelecting>(create: (_) => IconSelecting()),
  ChangeNotifierProvider<PostCardController>(
      create: (_) => PostCardController()),
  ChangeNotifierProvider<BottomRollController>(
      create: (_) => BottomRollController()),
  ChangeNotifierProvider<CommentController>(create: (_) => CommentController()),
];
