import 'package:get/get.dart';

class NavBarController extends GetxController {
  RxInt indexNum=0.obs;
  void changeIndex(newIndex){
    indexNum.value=newIndex;
  }

}
