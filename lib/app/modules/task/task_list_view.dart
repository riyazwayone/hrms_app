import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_gaps.dart';
import 'package:hrms_app/app/core/theme/app_text_style.dart';
import 'package:hrms_app/app/core/utils/extensions/duration_to_ago.dart';
import 'package:hrms_app/app/modules/task/task_list_controller.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

import '../../core/utils/app_utils.dart';
import '../../data/models/task/task_model.dart';

class TaskListView extends GetView<TaskListController> {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Task List',
          style: AppTextStyle.heading1,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.sort,
              color: AppColors.primary,
            ),
            onPressed: controller.toggleSortByDate,
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildFilterChips(),
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.hasError.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.errorMessage.value,
                      style: AppTextStyle.subtitle1.copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.fetchTasks,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            final filteredTasks = controller.getFilteredTasks();
            if (filteredTasks.isEmpty) {
              return Center(
                child: Text(
                  'No tasks found',
                  style: AppTextStyle.subtitle1,
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: controller.fetchTasks,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  return _buildTaskCard(filteredTasks[index]);
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Obx(
        () => Row(
          children: controller.filterOptions.map((filter) {
            final isSelected = controller.selectedFilter.value == filter;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Text(filter),
                selected: isSelected,
                onSelected: (_) => controller.changeFilter(filter),
                backgroundColor: Colors.grey[200],
                selectedColor: AppColors.primary.withOpacity(0.2),
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primary : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTaskCard(TaskModel task) {
    // Format deadline date and time using existing utilities
    String deadlineDate = '';
    String deadlineTime = '';

    if (task.deadline != null) {
      // Use the fancy date formatter extension
      deadlineDate = task.deadline!.toFancyDate();
      // Use the time formatter utility
      deadlineTime = AppUtils.formatTime(task.deadline!);
    }

    // Check if task is overdue
    final isOverdue = task.status.toLowerCase() != 'completed' &&
        task.deadline != null &&
        task.deadline!.isBefore(DateTime.now());

    // Determine priority color
    Color priorityColor;
    switch (task.priority.toLowerCase()) {
      case 'high':
        priorityColor = Colors.red;
        break;
      case 'medium':
        priorityColor = Colors.orange;
        break;
      default:
        priorityColor = Colors.green;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.taskTitle,
                    style: AppTextStyle.heading3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    task.priority,
                    style: TextStyle(
                      color: priorityColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              task.taskDescription,
              style: AppTextStyle.body2,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: isOverdue ? Colors.red : Colors.grey[700],
                ),
                const SizedBox(width: 4),
                Text(
                  'Deadline: $deadlineDate at $deadlineTime',
                  style: TextStyle(
                    fontSize: 13,
                    color: isOverdue ? Colors.red : Colors.grey[700],
                    fontWeight: isOverdue ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (isOverdue)
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'OVERDUE',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_outline, size: 16, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Text(
                  'Assigned by: ${task.assignedBy.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusChip(task.status),
              ],
            ),
            if (task.status.toLowerCase() != 'completed') ...{
              Gap(AppGaps.small),
              SquareSlideToActionButton(
                width: 99.w,
                height: 40,
                parentBoxRadiusValue: 10,
                initialSlidingActionLabel: 'Slide to Complete',
                finalSlidingActionLabel: 'Task Completed',
                parentBoxBackgroundColor: AppColors.primary.withOpacity(.4),
                parentBoxDisableBackgroundColor: Colors.grey,
                squareSlidingButtonBackgroundColor: AppColors.buttonPrimary,
                isEnable: task.status.toLowerCase() != 'completed',
                onSlideActionCompleted: () {
                  Fluttertoast.showToast(msg: "Task marked as completed");
                },
                onSlideActionCanceled: () {
                  print("Sliding action cancelled");
                },
                squareSlidingButtonSize: 35,
                squareSlidingButtonIcon: const Icon(
                  size: 20,
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    IconData iconData;

    switch (status.toLowerCase()) {
      case 'completed':
        chipColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case 'in progress':
        chipColor = Colors.blue;
        iconData = Icons.refresh;
        break;
      // case 'pending':
      //   chipColor = Colors.orange;
      //   iconData = Icons.access_time;
      //   break;
      default:
        chipColor = Colors.grey;
        iconData = Icons.help_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 14, color: chipColor),
          const SizedBox(width: 4),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              color: chipColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(TaskModel task) {
    Get.toNamed(AppRoutes.taskDetails, arguments: task);
  }

  Widget _buildFloatingActionButton() {
    // We'll handle this asynchronously in the build method
    return FutureBuilder<String>(
      future: controller.getUserRole(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final userRole = snapshot.data;
          if (userRole == 'admin' || userRole == 'hr') {
            return FloatingActionButton(
              onPressed: () => Get.toNamed(AppRoutes.createTask)
                  ?.then((result) => controller.fetchTasks()),
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add),
            );
          }
        }
        // Return an empty container if the user role doesn't match
        return Container();
      },
    );
  }
}
