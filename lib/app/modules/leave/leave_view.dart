import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_gaps.dart';
import 'leave_controller.dart';

class LeaveView extends GetView<LeaveController> {
  const LeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Leave Management',
          style: AppTextStyles.h5.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/leave/apply'),
            icon: Icon(
              Icons.add,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leave Balance Cards
            _buildLeaveBalanceCards(),
            Gap(AppGaps.large),

            // Filter Tabs
            _buildFilterTabs(),
            Gap(AppGaps.medium),

            // Leave History
            _buildLeaveHistory(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showApplyLeaveBottomSheet(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildLeaveBalanceCards() {
    return Row(
      children: [
        Expanded(
          child: _buildBalanceCard(
            'Total Leave',
            controller.totalLeaves.value.toString(),
            'days',
            Icons.calendar_today,
            AppColors.primary,
          ),
        ),
        Gap(AppGaps.small),
        Expanded(
          child: Obx(() => _buildBalanceCard(
                'Used',
                controller.usedLeaves.value.toString(),
                'days',
                Icons.event_busy,
                Colors.red,
              )),
        ),
        Gap(AppGaps.small),
        Expanded(
          child: Obx(() => _buildBalanceCard(
                'Remaining',
                '${controller.totalLeaves.value - controller.usedLeaves.value}',
                'days',
                Icons.event_available,
                Colors.green,
              )),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(
      String title, String value, String unit, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          Gap(AppGaps.small),
          Text(
            value,
            style: AppTextStyles.h5.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            unit,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return DefaultTabController(
      length: 4,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicator: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Pending'),
            Tab(text: 'Approved'),
            Tab(text: 'Rejected'),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave History',
          style: AppTextStyles.h6.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(AppGaps.medium),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.leaveHistory.length,
              itemBuilder: (context, index) {
                final leave = controller.leaveHistory[index];
                return _buildLeaveCard(leave);
              },
            )),
      ],
    );
  }

  Widget _buildLeaveCard(Map<String, dynamic> leave) {
    final statusColor = controller.getStatusColor(leave['status']);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(
            color: statusColor,
            width: 4,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leave['type'],
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${leave['startDate']} to ${leave['endDate']}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      controller.getStatusText(leave['status']),
                      style: AppTextStyles.caption.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Gap(AppGaps.small),
                  Text(
                    '${leave['days']} day${leave['days'] > 1 ? 's' : ''}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(AppGaps.small),
          Text(
            'Reason: ${leave['reason']}',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(AppGaps.small),
          Row(
            children: [
              Text(
                'Applied: ${leave['appliedDate']}',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              if (leave['status'] == 'pending')
                TextButton(
                  onPressed: () => controller.cancelLeave(leave['id']),
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              TextButton(
                onPressed: () => controller.viewLeaveDetails(leave),
                child: Text(
                  'View Details',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showApplyLeaveBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _buildApplyLeaveForm(),
    );
  }

  Widget _buildApplyLeaveForm() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(Get.context!).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Apply for Leave',
                style: AppTextStyles.h6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Gap(AppGaps.medium),

          // Leave Type Dropdown
          Text(
            'Leave Type',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(AppGaps.small),
          Obx(() => DropdownButtonFormField<String>(
                value: controller.selectedLeaveType.value.isEmpty
                    ? null
                    : controller.selectedLeaveType.value,
                items: controller.leaveTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) => controller.selectLeaveType(value ?? ''),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Select leave type',
                ),
              )),
          Gap(AppGaps.medium),

          // Date Selection
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Date',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(AppGaps.small),
                    Obx(() => TextFormField(
                          readOnly: true,
                          onTap: () => _selectDate(Get.context!, true),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Select date',
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                            text: controller.startDate.value,
                          ),
                        )),
                  ],
                ),
              ),
              Gap(AppGaps.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End Date',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(AppGaps.small),
                    Obx(() => TextFormField(
                          readOnly: true,
                          onTap: () => _selectDate(Get.context!, false),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Select date',
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                            text: controller.endDate.value,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Gap(AppGaps.medium),

          // Calculated Days
          Obx(() => controller.calculatedDays.value > 0
              ? Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      Gap(AppGaps.small),
                      Text(
                        'Total days: ${controller.calculatedDays.value}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox()),
          Gap(AppGaps.medium),

          // Reason
          Text(
            'Reason',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(AppGaps.small),
          TextFormField(
            maxLines: 3,
            onChanged: controller.setReason,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter reason for leave',
            ),
          ),
          Gap(AppGaps.large),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.submitLeaveApplication,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Submit Application',
                style: AppTextStyles.buttonMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      final dateString = picked.toString().substring(0, 10);
      if (isStartDate) {
        controller.setStartDate(dateString);
      } else {
        controller.setEndDate(dateString);
      }
    }
  }
}
