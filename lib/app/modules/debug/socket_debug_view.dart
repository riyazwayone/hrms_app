import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';

/// A debug view to test and monitor socket connection
class SocketDebugView extends StatelessWidget {
  final ChatSocketService _socketService = Get.find<ChatSocketService>();

  SocketDebugView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket Connection Debug'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildConnectionStatus(),
            const SizedBox(height: 24),
            _buildConnectionActions(),
            const SizedBox(height: 24),
            _buildConnectionInfo(),
            const SizedBox(height: 24),
            _buildMessageTester(),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionStatus() {
    return Obx(() {
      final isConnected = _socketService.isConnected.value;
      final status = _socketService.connectionStatus.value;
      final error = _socketService.lastError.value;

      return Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Connection Status', style: Get.textTheme.titleLarge),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isConnected ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isConnected ? 'Connected' : 'Disconnected',
                    style: Get.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text('Status: $status', style: Get.textTheme.bodyLarge),
              if (error.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Error: $error',
                  style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildConnectionActions() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Connection Actions', style: Get.textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _socketService.reconnect(),
                    child: const Text('Reconnect'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => _socketService.disconnect(),
                    child: const Text('Disconnect'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionInfo() {
    return Obx(() {
      final debugInfo = _socketService.getDebugInfo();

      return Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Connection Details', style: Get.textTheme.titleLarge),
              const SizedBox(height: 16),
              _buildInfoRow('Socket URL', debugInfo['socketUrl']),
              _buildInfoRow('Socket Initialized',
                  debugInfo['socketInitialized'].toString()),
              _buildInfoRow('Transport Options',
                  debugInfo['transportOptions'].toString()),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$label:',
              style: Get.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value, style: Get.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTester() {
    final receiverIdController = TextEditingController();
    final messageController = TextEditingController();

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Test Messaging', style: Get.textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: receiverIdController,
              decoration: const InputDecoration(
                labelText: 'Receiver ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (receiverIdController.text.isNotEmpty &&
                      messageController.text.isNotEmpty) {
                    _socketService.sendMessage(
                      receiverIdController.text,
                      messageController.text,
                    );
                    messageController.clear();
                    Get.snackbar(
                      'Message Sent',
                      'Message sent to ${receiverIdController.text}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter receiver ID and message',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Send Test Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
