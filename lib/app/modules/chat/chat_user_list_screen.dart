import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/modules/chat/chat_conversation_screen.dart';
import 'package:hrms_app/app/global_widgets/custom_app_bar.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';
import 'package:hrms_app/service_locator.dart';

class ChatUserListScreen extends StatefulWidget {
  const ChatUserListScreen({Key? key}) : super(key: key);

  @override
  State<ChatUserListScreen> createState() => _ChatUserListScreenState();
}

class _ChatUserListScreenState extends State<ChatUserListScreen> {
  final ChatSocketService _chatService = sl<ChatSocketService>();
  final UserService _userService = sl<UserService>();

  // In a real app, this would come from an API call to get users
  // For now, we'll use dummy data for demonstration
  final RxList<UserModel> _users = <UserModel>[].obs;
  final RxBool _isLoading = true.obs;
  final RxMap<int, bool> _onlineUsers = <int, bool>{}.obs;
  final allEmployeesController = Get.isRegistered<AllEmployeesController>()
      ? Get.find<AllEmployeesController>()
      : Get.put(AllEmployeesController());

  @override
  void initState() {
    super.initState();
    // Listen for online/offline status changes
    _chatService.onUserOnline = (userId) {
      final id = int.tryParse(userId);
      if (id != null) {
        _onlineUsers[id] = true;
      }

      _users.value = allEmployeesController.employees
          .where((e) => e.id != sl<UserService>().getCurrentUserSync()!.id)
          .map((e) => UserModel(
                id: e.id,
                name: e.employeeName,
                email: e.email,
                role: e.designation.toLowerCase() == 'hr'
                    ? UserRole.hr
                    : UserRole.employee,
              ))
          .toList();
    };

    _chatService.onUserOffline = (userId) {
      final id = int.tryParse(userId);
      if (id != null) {
        _onlineUsers[id] = false;
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Chat',
        showBackButton: true,
      ),
      body: Obx(() {
        if (_isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_users.isEmpty) {
          return const Center(child: Text('No users available'));
        }

        final currentUser = _userService.getCurrentUserSync();
        final filteredUsers = _users.where((user) {
          // Remove current user from the list
          if (user.id == currentUser?.id) {
            return false;
          }

          // If current user is employee, only show HR and Admin users
          if (currentUser?.role == UserRole.employee) {
            return user.role == UserRole.hr || user.role == UserRole.admin;
          }

          // HR and Admin can see everyone
          return true;
        }).toList();

        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            final user = filteredUsers[index];
            final isOnline = _onlineUsers[user.id] ?? false;

            return ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    child: Text(user.name.isNotEmpty ? user.name[0] : '?'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: isOnline ? Colors.green : Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(user.name),
              subtitle: Text(user.role.name.capitalize!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.to(() => ChatConversationScreen(
                      receiverId: user.id.toString(),
                      receiverName: user.name,
                    ));
              },
            );
          },
        );
      }),
    );
  }
}
