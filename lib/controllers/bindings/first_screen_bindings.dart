import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hb_task/controllers/first_screen_controller.dart';

class FirstScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FirstScreenController());
  }
}
