import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/duration_to_ago.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/app_utils.dart';
import '../../global_widgets/custom_app_bar.dart';
import 'ateendance_list_controller.dart';

class AttendanceListView extends GetView<AttendanceListController> {
  final int employeeId;
  final String employeeName;

  const AttendanceListView({
    super.key,
    required this.employeeId,
    required this.employeeName,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttendanceListController(
      employeeId: employeeId,
      employeeName: employeeName,
    ));

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Monthly Attendance',
        showBackButton: true,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildBody(context, controller);
      }),
    );
  }

  Widget _buildBody(BuildContext context, AttendanceListController controller) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMonthSelector(controller),
          _buildDaySelector(context, controller),
          _buildAttendanceDetails(context, controller),
        ],
      ),
    );
  }

  Widget _buildMonthSelector(AttendanceListController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => controller.changeMonth(-1),
          ),
          Obx(() {
            final monthName = controller.selectedMonth.value.toFancyDate();
            return Text(
              monthName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // Don't allow selecting future months beyond current month
              final now = DateTime.now();
              final selectedMonth = controller.selectedMonth.value;
              if (selectedMonth.year < now.year ||
                  (selectedMonth.year == now.year &&
                      selectedMonth.month < now.month)) {
                controller.changeMonth(1);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector(
      BuildContext context, AttendanceListController controller) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.daysInMonth.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final day = controller.daysInMonth[index];
            final isSelected = controller.selectedDayIndex.value == index;
            final isToday = day.day == DateTime.now().day &&
                day.month == DateTime.now().month &&
                day.year == DateTime.now().year;

            final attendance = controller.attendanceData[day];
            final isPresent =
                attendance != null && attendance.status == 'Present';
            final isAbsent =
                attendance != null && attendance.status == 'Absent';
            final isMissing = attendance == null;

            Color backgroundColor;
            if (isSelected) {
              backgroundColor = AppColors.primary;
            } else if (isPresent) {
              backgroundColor = Colors.green.shade50;
            } else if (isAbsent) {
              backgroundColor = Colors.red.shade50;
            } else if (isToday) {
              backgroundColor = Colors.blue.shade50;
            } else {
              backgroundColor = Colors.grey.shade100;
            }
            return GestureDetector(
              onTap: () => controller.selectDay(index),
              child: Container(
                width: 70,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected
                      ? Border.all(color: AppColors.primary, width: 2)
                      : Border.all(color: Colors.transparent),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppUtils.getWeekdayShortName(day),
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isPresent
                            ? Colors.green
                            : isAbsent
                                ? Colors.red
                                : isMissing
                                    ? Colors.transparent
                                    : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildAttendanceDetails(
      BuildContext context, AttendanceListController controller) {
    return Obx(() {
      final attendance = controller.getSelectedDayAttendance();
      final selectedDate =
          controller.daysInMonth[controller.selectedDayIndex.value];

      if (attendance == null) {
        final isWeekend = selectedDate.weekday == DateTime.saturday ||
            selectedDate.weekday == DateTime.sunday;
        final isFutureDate = selectedDate.isAfter(DateTime.now());

        String message;
        if (isWeekend) {
          message = 'Weekend - No Attendance Required';
        } else if (isFutureDate) {
          message = 'Future Date';
        } else {
          message = 'Not Attended';
        }

        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Column(
              children: [
                Icon(
                  isWeekend
                      ? Icons.weekend
                      : (isFutureDate
                          ? Icons.calendar_today
                          : Icons.do_not_disturb),
                  size: 48,
                  color: isWeekend
                      ? Colors.blue
                      : (isFutureDate ? Colors.grey : Colors.red),
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isWeekend) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Enjoy your ${AppUtils.getWeekdayFullName(selectedDate)}!',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ] else if (!isFutureDate) ...[
                  const SizedBox(height: 8),
                  Text(
                    'No attendance record found for this date.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildDetailItem('Shift', 'Morning'),
            _buildDetailItem(
              'Shift Timing',
              '09:45 AM_09:45 PM',
            ),
            _buildDetailItem(
              'Punch In Time',
              controller.formatTime(attendance.inTime),
            ),
            _buildDetailItem(
              'Late Hrs',
              controller.formatDuration(attendance.lateHour ?? Duration.zero),
            ),
            _buildDetailItem(
              'Punch Out',
              attendance.outTime != null
                  ? controller.formatTime(attendance.outTime)
                  : '0.00',
            ),
            _buildDetailItem(
              'Early Punch Out',
              controller.formatDuration(attendance.earlyLeave ?? Duration.zero),
            ),
            _buildDetailItem(
              'Working Hrs',
              attendance.outTime != null
                  ? controller.formatDuration(attendance.outTime! -
                      (attendance.inTime ?? Duration.zero))
                  : '0.00',
            ),
            _buildDetailItem(
              'Status',
              attendance.status ?? 'Unknown',
              valueColor:
                  attendance.status == 'Present' ? Colors.green : Colors.red,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDetailItem(String label, String value, {Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
