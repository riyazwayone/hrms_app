import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_gaps.dart';
import 'attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Attendance',
          style: AppTextStyles.h5.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.refreshAttendance,
            icon: Icon(
              Icons.refresh,
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
            // Today's Attendance Card
            _buildTodayAttendanceCard(),
            Gap(AppGaps.large),

            // Quick Stats
            _buildQuickStats(),
            Gap(AppGaps.large),

            // Check In/Out Buttons
            _buildCheckInOutButtons(),
            Gap(AppGaps.large),

            // Weekly Chart
            _buildWeeklyChart(),
            Gap(AppGaps.large),

            // Attendance History
            _buildAttendanceHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayAttendanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.today,
                color: Colors.white,
                size: 24,
              ),
              Gap(AppGaps.small),
              Text(
                'Today\'s Attendance',
                style: AppTextStyles.h6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Obx(() => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      controller.currentStatus.value,
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ],
          ),
          Gap(AppGaps.medium),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check In',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    // Obx(() => Text(
                    //       controller.todayCheckIn.value.isEmpty
                    //           ? '--:--'
                    //           : controller.todayCheckIn.value,
                    //       style: AppTextStyles.h5.copyWith(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check Out',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Obx(() => Text(
                          controller.todayCheckOut.value.isEmpty
                              ? '--:--'
                              : controller.todayCheckOut.value,
                          style: AppTextStyles.h5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Hours',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Obx(() => Text(
                          controller.totalHoursToday.value,
                          style: AppTextStyles.h5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'This Week',
            '${controller.currentWeekHours.value}h',
            Icons.calendar_view_week,
            Colors.blue,
          ),
        ),
        Gap(AppGaps.small),
        Expanded(
          child: _buildStatCard(
            'This Month',
            '${controller.currentMonthHours.value}h',
            Icons.calendar_month,
            Colors.green,
          ),
        ),
        Gap(AppGaps.small),
        Expanded(
          child: _buildStatCard(
            'Attendance',
            '${controller.attendancePercentage.value}%',
            Icons.trending_up,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
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
            style: AppTextStyles.h6.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
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

  Widget _buildCheckInOutButtons() {
    return Row(
      children: [
        Expanded(
          child: Obx(() => ElevatedButton.icon(
                onPressed:
                    controller.isCheckedIn.value ? null : controller.checkIn,
                icon: const Icon(Icons.login, color: Colors.white),
                label: Text(
                  'Check In',
                  style:
                      AppTextStyles.buttonMedium.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.isCheckedIn.value ? Colors.grey : Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )),
        ),
        Gap(AppGaps.medium),
        Expanded(
          child: Obx(() => ElevatedButton.icon(
                onPressed:
                    !controller.isCheckedIn.value ? null : controller.checkOut,
                icon: const Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Check Out',
                  style:
                      AppTextStyles.buttonMedium.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      !controller.isCheckedIn.value ? Colors.grey : Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Widget _buildWeeklyChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Weekly Hours',
                style: AppTextStyles.h6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: controller.viewAttendanceReport,
                child: Text(
                  'View Report',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          Gap(AppGaps.medium),
          SizedBox(
            height: 120,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: controller.weeklyData.map((data) {
                    final hours = data['hours'] as double;
                    final height =
                        (hours / 8) * 80; // Max height 80px for 8 hours
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 24,
                          height: height,
                          decoration: BoxDecoration(
                            color: hours > 0
                                ? AppColors.primary
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Gap(AppGaps.small),
                        Text(
                          data['day'],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent Attendance',
              style: AppTextStyles.h6.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: controller.requestAttendanceCorrection,
              child: Text(
                'Request Correction',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Gap(AppGaps.medium),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.attendanceHistory.take(7).length,
              itemBuilder: (context, index) {
                final attendance = controller.attendanceHistory[index];
                return _buildAttendanceCard(attendance);
              },
            )),
      ],
    );
  }

  Widget _buildAttendanceCard(Map<String, dynamic> attendance) {
    final statusColor = controller.getStatusColor(attendance['status']);
    final statusIcon = controller.getStatusIcon(attendance['status']);

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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendance['date'],
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(AppGaps.small),
                Row(
                  children: [
                    Text(
                      'In: ${attendance['checkIn'].isEmpty ? '--:--' : attendance['checkIn']}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(AppGaps.medium),
                    Text(
                      'Out: ${attendance['checkOut'].isEmpty ? '--:--' : attendance['checkOut']}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    statusIcon,
                    color: statusColor,
                    size: 20,
                  ),
                  Gap(AppGaps.small),
                  Text(
                    controller.getStatusText(attendance['status']),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(AppGaps.small),
              Text(
                attendance['totalHours'],
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
