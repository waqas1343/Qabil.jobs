

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
  SelectorsModel(AppStrings.marketingLogo, AppLogo.marketLogo),
  SelectorsModel(AppStrings.python, AppLogo.pythonLogo),
  SelectorsModel(AppStrings.leadGenerate, AppLogo.leadGenerationLogo),
  SelectorsModel(AppStrings.cyberSecurity, AppLogo.cyberLogo),
  SelectorsModel(AppStrings.uiux, AppLogo.uiuxLogo),
  SelectorsModel(AppStrings.gameDevelop, AppLogo.gameDevelopLogo),
  SelectorsModel(AppStrings.nodeJs, AppLogo.nodeJsLogo),
  SelectorsModel(AppStrings.reactJs, AppLogo.reactJs),

];