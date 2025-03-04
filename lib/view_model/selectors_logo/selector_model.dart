import 'package:qabil_app/constant/aap_Logo/logoPlace.dart';
import 'package:qabil_app/constant/app_strings/appstrings.dart';

class SelectorsModel{
  final String name;
  final String image;

  SelectorsModel(this.name, this.image);

}

List<SelectorsModel> listRepo = [
  SelectorsModel(AppStrings.uiUxLogo,AppLogo.uiUx),
  SelectorsModel(AppStrings.eCommerceLogo, AppLogo.e_Commerce),
  SelectorsModel(AppStrings.marketingLogo, AppLogo.marketingLogo),
  SelectorsModel(AppStrings.flutterLogo, AppLogo.flutter),
  SelectorsModel(AppStrings.figmaLogo, AppLogo.figma),
  SelectorsModel(AppStrings.dartLogo, AppLogo.dart),
  SelectorsModel(AppStrings.htmlCssLogo, AppLogo.htmlCss),
  SelectorsModel(AppStrings.dataAnalystLogo,AppLogo.dataAnalysis),
  SelectorsModel(AppStrings.pythonLogo,AppLogo.python),
  SelectorsModel(AppStrings.cyberSecurityLogo,AppLogo.cyberSecurity),
  SelectorsModel(AppStrings.amazonLogo, AppLogo.amazonPrivate),
  SelectorsModel(AppStrings.jsReactLogo, AppLogo.jsReact),
  SelectorsModel(AppStrings.leadGenerationLogo, AppLogo.leadGeneration),

];