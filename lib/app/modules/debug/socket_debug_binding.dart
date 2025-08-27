import 'package:get/get.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/service_locator.dart';

class SocketDebugBinding extends Bindings {
  @override
  void dependencies() {
    // Make sure ChatSocketService is available
    if (!Get.isRegistered<ChatSocketService>()) {
      Get.put(sl<ChatSocketService>());
    }
  }
}
