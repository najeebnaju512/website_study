import 'package:get/get.dart';
import 'package:nexteons_study_project/model/mainFrameButton/main_frame_button_model.dart';

import '../../utils/router_names.dart';

class MainFrameController extends GetxController {
  RxList<FrameButtonData> buttonData = [
  FrameButtonData("Show Students", Routernames.showDatas),
  FrameButtonData("Add Students", Routernames.addDatas),
].obs;
}
