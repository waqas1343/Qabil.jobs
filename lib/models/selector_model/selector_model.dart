

import '../../constant/aap_Logo/logo_place.dart';
import '../../constant/app_strings/appstrings.dart';

class SelectorsModel{
  final String name;
  final String image;

  SelectorsModel(this.name, this.image);

}

List<SelectorsModel> listRepo = [

  SelectorsModel(AppStrings.flutterLogo, AppLogo.flutter),
  SelectorsModel(AppStrings.figmaLogo, AppLogo.figma),
  SelectorsModel(AppStrings.dartLogo, AppLogo.dart),
  SelectorsModel(AppStrings.htmlCssLogo, AppLogo.htmlCss),
  SelectorsModel(AppStrings.dartLogo, AppLogo.dart),
  SelectorsModel(AppStrings.flutterLogo, AppLogo.flutter),
  SelectorsModel(AppStrings.figmaLogo, AppLogo.figma),
  SelectorsModel(AppStrings.htmlCssLogo, AppLogo.htmlCss),
  SelectorsModel(AppStrings.flutterLogo, AppLogo.flutter),
  SelectorsModel(AppStrings.dartLogo, AppLogo.dart),


];