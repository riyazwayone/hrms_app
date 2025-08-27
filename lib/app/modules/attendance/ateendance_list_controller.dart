import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/attendance/attendance_model.dart';
import 'package:hrms_app/app/data/repositories/__attendance.dart';
import 'package:hrms_app/service_locator.dart';

class AttendanceListController extends GetxController {
  final int employeeId;
  final String employeeName;

  // Observable variables
  final RxInt selectedDayIndex = 0.obs;
  final RxList<DateTime> daysInMonth = <DateTime>[].obs;
  final Rx<DateTime> selectedMonth = DateTime.now().obs;
  final RxMap<DateTime, AttendanceModel?> attendanceData =
      <DateTime, AttendanceModel?>{}.obs;
  final RxBool isLoading = false.obs;

  AttendanceListController(
      {required this.employeeId, required this.employeeName});

  @override
  void onInit() {
    super.onInit();
    _generateDaysInMonth();
    fetchAttendanceData();
  }

  void _generateDaysInMonth() {
    final DateTime lastDay =
        DateTime(selectedMonth.value.year, selectedMonth.value.month + 1, 0);

    List<DateTime> days = [];
    for (int i = 1; i <= lastDay.day; i++) {
      days.add(
          DateTime(selectedMonth.value.year, selectedMonth.value.month, i));
    }

    daysInMonth.value = days;

    // Select current day if it's in this month, otherwise select first day
    final currentDay = DateTime.now().day;
    if (currentDay <= days.length &&
        selectedMonth.value.month == DateTime.now().month) {
      selectedDayIndex.value = currentDay - 1;
    } else {
      selectedDayIndex.value = 0;
    }
  }

  void changeMonth(int offset) {
    selectedMonth.value = DateTime(
        selectedMonth.value.year, selectedMonth.value.month + offset, 1);
    _generateDaysInMonth();
    fetchAttendanceData();
  }

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }

  Future<void> fetchAttendanceData() async {
    try {
      isLoading.value = true;

      // Get attendance data from repository
      final attendanceList = await sl<AttendanceRepository>().getAttendanceList(
          employeeId: employeeId.toString(),
          month: selectedMonth.value.month.toString(),
          year: selectedMonth.value.year.toString());

      // Create a map to store attendance data by date
      final Map<DateTime, AttendanceModel?> attendanceByDate = {};

      // Initialize all days in month with null attendance
      for (final day in daysInMonth) {
        attendanceByDate[day] = null;
      }

      // Add attendance records from API response
      for (final attendance in attendanceList) {
        if (attendance.attendanceDate != null) {
          // Find the matching day in our days list
          final matchingDay = daysInMonth.firstWhereOrNull((day) =>
              day.year == attendance.attendanceDate!.year &&
              day.month == attendance.attendanceDate!.month &&
              day.day == attendance.attendanceDate!.day);

          if (matchingDay != null) {
            attendanceByDate[matchingDay] = attendance;
          }
        }
      }

      // Update the observable map
      attendanceData.value = attendanceByDate;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load attendance data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  AttendanceModel? getSelectedDayAttendance() {
    if (selectedDayIndex.value < 0 ||
        selectedDayIndex.value >= daysInMonth.length) {
      return null;
    }

    final selectedDay = daysInMonth[selectedDayIndex.value];
    return attendanceData[selectedDay];
  }

  String formatDuration(Duration? duration) {
    if (duration == null) return '0:00';

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}';
  }

  String formatTime(Duration? duration) {
    if (duration == null) return '--:--';

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final period = hours >= 12 ? 'PM' : 'AM';
    final hour12 = hours > 12 ? hours - 12 : (hours == 0 ? 12 : hours);

    return '$hour12:${minutes.toString().padLeft(2, '0')} $period';
  }
}
