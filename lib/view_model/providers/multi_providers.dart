import 'package:provider/provider.dart';
import 'package:qabil_app/view_model/providers/corse_select_provider.dart';
import 'package:qabil_app/view_model/providers/select%20gender.dart';

import '../controller/course_select_controller/course_select_scontroller.dart';
import '../controller/image_picker/image_picker_controller.dart';

final List<ChangeNotifierProvider> multiAppProviders = [
  
  ChangeNotifierProvider<ListPractice>(create: (_) => ListPractice()),
  ChangeNotifierProvider<GenderProvider>(create: (_) => GenderProvider()),
  ChangeNotifierProvider<ImagePickerController>(
      create: (_) => ImagePickerController()),
  ChangeNotifierProvider<Providerc>(create: (_) => Providerc()),
];
