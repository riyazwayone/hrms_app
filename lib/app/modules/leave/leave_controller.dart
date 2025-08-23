import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  static LeaveController get to => Get.find();

  // Observable variables
  final RxList<Map<String, dynamic>> leaveHistory = <Map<String, dynamic>>[
    {
      'id': '1',
      'type': 'Annual Leave',
      'startDate': '2025-08-20',
      'endDate': '2025-08-22',
      'days': 3,
      'reason': 'Family vacation',
      'status': 'approved',
      'appliedDate': '2025-08-10',
    },
    {
      'id': '2',
      'type': 'Sick Leave',
      'startDate': '2025-08-15',
      'endDate': '2025-08-15',
      'days': 1,
      'reason': 'Medical checkup',
      'status': 'pending',
      'appliedDate': '2025-08-14',
    },
    {
      'id': '3',
      'type': 'Casual Leave',
      'startDate': '2025-08-05',
      'endDate': '2025-08-06',
      'days': 2,
      'reason': 'Personal work',
      'status': 'rejected',
      'appliedDate': '2025-08-03',
    },
  ].obs;

  final RxList<String> leaveTypes = [
    'Annual Leave',
    'Sick Leave',
    'Casual Leave',
    'Maternity/Paternity Leave',
    'Emergency Leave',
  ].obs;

  final RxInt totalLeaves = 25.obs;
  final RxInt usedLeaves = 8.obs;
  final RxInt pendingLeaves = 1.obs;

  // Form variables
  final RxString selectedLeaveType = ''.obs;
  final RxString startDate = ''.obs;
  final RxString endDate = ''.obs;
  final RxString reason = ''.obs;
  final RxInt calculatedDays = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadLeaveData();
  }

  void loadLeaveData() {
    // Simulate loading leave data from API
    // Calculate used leaves from history
    usedLeaves.value = leaveHistory
        .where((leave) => leave['status'] == 'approved')
        .fold(0, (sum, leave) => sum + (leave['days'] as int));

    // Calculate pending leaves
    pendingLeaves.value =
        leaveHistory.where((leave) => leave['status'] == 'pending').length;
  }

  void selectLeaveType(String type) {
    selectedLeaveType.value = type;
  }

  void setStartDate(String date) {
    startDate.value = date;
    _calculateDays();
  }

  void setEndDate(String date) {
    endDate.value = date;
    _calculateDays();
  }

  void _calculateDays() {
    if (startDate.value.isNotEmpty && endDate.value.isNotEmpty) {
      try {
        final start = DateTime.parse(startDate.value);
        final end = DateTime.parse(endDate.value);
        if (end.isAfter(start) || end.isAtSameMomentAs(start)) {
          calculatedDays.value = end.difference(start).inDays + 1;
        } else {
          calculatedDays.value = 0;
        }
      } catch (e) {
        calculatedDays.value = 0;
      }
    } else {
      calculatedDays.value = 0;
    }
  }

  void setReason(String value) {
    reason.value = value;
  }

  bool validateForm() {
    if (selectedLeaveType.value.isEmpty) {
      Get.snackbar('Error', 'Please select leave type');
      return false;
    }
    if (startDate.value.isEmpty) {
      Get.snackbar('Error', 'Please select start date');
      return false;
    }
    if (endDate.value.isEmpty) {
      Get.snackbar('Error', 'Please select end date');
      return false;
    }
    if (reason.value.trim().isEmpty) {
      Get.snackbar('Error', 'Please provide reason for leave');
      return false;
    }
    if (calculatedDays.value <= 0) {
      Get.snackbar('Error', 'Invalid date range');
      return false;
    }
    return true;
  }

  void submitLeaveApplication() {
    if (!validateForm()) return;

    // Create new leave application
    final newLeave = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'type': selectedLeaveType.value,
      'startDate': startDate.value,
      'endDate': endDate.value,
      'days': calculatedDays.value,
      'reason': reason.value,
      'status': 'pending',
      'appliedDate': DateTime.now().toString().substring(0, 10),
    };

    // Add to leave history
    leaveHistory.insert(0, newLeave);

    // Update pending leaves count
    pendingLeaves.value++;

    // Clear form
    clearForm();

    Get.snackbar(
      'Success',
      'Leave application submitted successfully',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate back to leave list
    Get.back();
  }

  void clearForm() {
    selectedLeaveType.value = '';
    startDate.value = '';
    endDate.value = '';
    reason.value = '';
    calculatedDays.value = 0;
  }

  void viewLeaveDetails(Map<String, dynamic> leave) {
    Get.toNamed('/leave/details', arguments: leave);
  }

  void cancelLeave(String leaveId) {
    Get.dialog(
      AlertDialog(
        title: const Text('Cancel Leave'),
        content: const Text(
            'Are you sure you want to cancel this leave application?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // Remove from list or update status
              final index =
                  leaveHistory.indexWhere((leave) => leave['id'] == leaveId);
              if (index != -1) {
                final leave = leaveHistory[index];
                if (leave['status'] == 'pending') {
                  leaveHistory.removeAt(index);
                  pendingLeaves.value--;
                  Get.back();
                  Get.snackbar('Success', 'Leave application cancelled');
                } else {
                  Get.back();
                  Get.snackbar(
                      'Error', 'Cannot cancel ${leave['status']} leave');
                }
              }
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFF4CAF50);
      case 'pending':
        return const Color(0xFFFF9800);
      case 'rejected':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  String getStatusText(String status) {
    return status.toUpperCase();
  }
}
