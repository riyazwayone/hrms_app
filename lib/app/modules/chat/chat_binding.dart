import 'package:get/get.dart';

import '../../data/services/chat_socket_service.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatSocketService>(() => ChatSocketService());
  }
}
