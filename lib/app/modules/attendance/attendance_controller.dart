import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';
import 'package:hrms_app/app/core/utils/extensions/duration_to_ago.dart';
import 'package:hrms_app/app/data/models/attendance/attendance_model.dart';
import 'package:logger/logger.dart';
import '../../../service_locator.dart';
import '../../data/repositories/__attendance.dart';
import '../../data/services/user_service.dart';

class AttendanceController extends GetxController {
  static AttendanceController get to => Get.find();
  final _logger = Logger();
  final AttendanceRepository _attendanceRepository = sl<AttendanceRepository>();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isCheckedIn = false.obs;
  final todayCheckIn = Duration(hours: 0, minutes: 0).obs;
  final elapsedTime = Duration(hours: 0, minutes: 0).obs;
  final RxString todayCheckOut = ''.obs;
  final progressbarColor = AppColors.primary.obs;
  final RxString totalHoursToday = '0h 0m'.obs;
  final RxString currentStatus = 'Pounch In'.obs;
  final RxString errorMessage = ''.obs;
  final RxString statusMessage = ''.obs;
  final RxDouble shiftProgress = 0.0.obs;

  final RxInt currentWeekHours = 32.obs;
  final RxInt currentMonthHours = 128.obs;
  final RxDouble attendancePercentage = 95.5.obs;

  StreamSubscription<dynamic>? streamSubscription;

  void runStreamDuration() {
    final user = sl<UserService>().getCurrentUserSync();
    final shift = AppUtils.parseTimeRangeToDurations(user!.shiftTiming);

    elapsedTime.value = Duration.zero;
    if (streamSubscription != null) streamSubscription!.cancel();
    final now = DateTime.now();
    final differentInSeconds = todayCheckIn.value -
        Duration(hours: now.hour, minutes: now.minute, seconds: now.second);
    elapsedTime.value = differentInSeconds;
    // Start a periodic timer to update the elapsed time
    streamSubscription = Stream.periodic(Duration(seconds: 1)).listen((_) {
      if (isCheckedIn.value) {
        elapsedTime.value += Duration(seconds: 1);
        if (shift != null && shift.isNotEmpty) {
          workingProgress(shift);
        }
      }
    });
  }

  void workingProgress(List<Duration> shift) {
    final now = DateTime.now();
    final baseTime = Duration(hours: now.hour, minutes: now.minute);

    final start = shift[0];
    final end = shift[1];

    // Calculate how much time has passed since shift started
    final timePassed = baseTime - start;

    // Clamp: if before start, it's 0
    if (timePassed.isNegative) {
      _logger.d("Working progress: 0 hours (shift not started yet)");
      return;
    }

    // Clamp: if after end, cap at total shift duration
    final totalShift = end - start;
    final effectivePassed = timePassed > totalShift ? totalShift : timePassed;
    final progress = (timePassed.inMilliseconds / totalShift.inMilliseconds)
        .clamp(0, 1) as double;
    shiftProgress.value = progress;
    _logger.d(
      "Working progress: ${effectivePassed.inHours}h "
      "${effectivePassed.inMinutes.remainder(60)}m "
      "out of ${totalShift.inHours}h "
      "Difference ${totalShift.compareTo(effectivePassed)}h "
      "Progress: ${progress * 100}%",
    );
  }

  // Attendance history
  final RxList<Map<String, dynamic>> attendanceHistory = <Map<String, dynamic>>[
    {
      'date': '2025-08-13',
      'checkIn': '09:00',
      'checkOut': '18:00',
      'totalHours': '8h 0m',
      'status': 'present',
    },
    {
      'date': '2025-08-12',
      'checkIn': '09:15',
      'checkOut': '18:00',
      'totalHours': '7h 45m',
      'status': 'present',
    },
    {
      'date': '2025-08-11',
      'checkIn': '10:30',
      'checkOut': '18:30',
      'totalHours': '8h 0m',
      'status': 'late',
    },
    {
      'date': '2025-08-10',
      'checkIn': '',
      'checkOut': '',
      'totalHours': '0h 0m',
      'status': 'absent',
    },
    {
      'date': '2025-08-09',
      'checkIn': '09:00',
      'checkOut': '17:30',
      'totalHours': '7h 30m',
      'status': 'present',
    },
  ].obs;

  // Weekly attendance chart data
  final RxList<Map<String, dynamic>> weeklyData = <Map<String, dynamic>>[
    {'day': 'Mon', 'hours': 8.0},
    {'day': 'Tue', 'hours': 7.5},
    {'day': 'Wed', 'hours': 8.0},
    {'day': 'Thu', 'hours': 0.0},
    {'day': 'Fri', 'hours': 8.5},
    {'day': 'Sat', 'hours': 0.0},
    {'day': 'Sun', 'hours': 0.0},
  ].obs;

  DateTime? checkInTime;
  DateTime? checkOutTime;

  @override
  void onInit() {
    super.onInit();
  }

  void loadTodayAttendance(AttendanceModel? attendanceModel) async {
    // _logger.d('Loading today attendance...${attendanceModel!.toJson()}');
    if (attendanceModel == null) return;

    if (attendanceModel.outTime != null &&
        attendanceModel.outTime!.inSeconds != 0) {
      currentStatus.value = 'Punch Out';
      streamSubscription?.cancel();
      final progress = sl<GetStorage>().read<double>("shift_progress");
      final seconds = sl<GetStorage>().read<int>("elapsed_time");
      elapsedTime.value = Duration(seconds: seconds ?? 0);
      shiftProgress.value = progress ?? 0.0;
      isCheckedIn.value = false;
      currentStatus.value = "You already punched out";
      progressbarColor.value = Colors.red;

      return;
    }

    isCheckedIn.value = true;

    if (attendanceModel.inTime != null) {
      currentStatus.value = "Punch Out";

      final inTimeStr = attendanceModel.inTime;
      todayCheckIn.value = inTimeStr!; // Format HH:MM

      // Update checkInTime for calculations
      final dateStr = attendanceModel.attendanceDate!.toHumanReadable();
      // throw inTimeStr;
      checkInTime = DateTime.parse('$dateStr $inTimeStr');
    } else {
      checkInTime = DateTime.now();
      todayCheckIn.value = Duration.zero;
    }

    runStreamDuration();
  }

  void checkIn() async {
    _logger.f(sl<GetStorage>().read<int>("elapsed_time"));
    if (isCheckedIn.value) {
      Fluttertoast.showToast(
        msg: 'Error: You are already checked in',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[100],
        textColor: Colors.red[800],
      );
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      statusMessage.value = '';

      _logger.d('Checking in...');

      final response = await _attendanceRepository.checkIn();
      // _logger.d('Check-in response: $response');

      isCheckedIn.value = true;
      currentStatus.value = 'Punch out';
      statusMessage.value = 'Check-in successful';

      // Get the check-in time from the response
      if (response.inTime != null) {
        final inTimeStr = response.inTime;
        todayCheckIn.value = inTimeStr!; // Format HH:MM

        // Update checkInTime for calculations
        final dateStr = response.attendanceDate!.toHumanReadable();
        // throw inTimeStr;
        checkInTime = DateTime.parse('$dateStr $inTimeStr');
      } else {
        checkInTime = DateTime.now();
        todayCheckIn.value = Duration.zero;
      }

      // Get.snackbar(
      //   'Success',
      //   statusMessage.value,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green[100],
      //   colorText: Colors.green[800],
      // );

      runStreamDuration();
    } catch (e) {
      // _logger.e('Error during check-in: $e');
      errorMessage.value = AppUtils.extractErrorMessage(e);
      _logger.e(errorMessage.value);

      Fluttertoast.showToast(
        msg: AppUtils.extractErrorMessage(e),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[100],
        textColor: Colors.red[800],
      );
    } finally {
      isLoading.value = false;
    }
  }

  void checkOut() async {
    if (!isCheckedIn.value) {
      Get.snackbar('Error', 'You need to check in first');
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      statusMessage.value = '';

      _logger.d('Checking out...');

      final response = await _attendanceRepository.checkOut();
      _logger.d('Check-out response: $response');

      isCheckedIn.value = false;
      currentStatus.value = 'Punched Out';
      statusMessage.value = 'Punched-out successful';

      if (response.inTime != null) {
        checkInTime = null;
        progressbarColor.value = AppColors.error;
        sl<GetStorage>().write("elapsed_time", elapsedTime.value.inSeconds);
        sl<GetStorage>().write("shift_progress", shiftProgress.value);
        streamSubscription?.cancel();
      }
    } catch (e) {
      _logger.e('Error during check-out: $e');
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to check out: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
      );
    } finally {
      isLoading.value = false;
    }
  }

  String _getAttendanceStatus(Duration checkInTime) {
    // Assuming office starts at 9:00 AM
    final hour = checkInTime.inHours;
    final minute = checkInTime.inMinutes % 60;
    final seconds = checkInTime.inSeconds % 60;

    if (hour > 9 || (hour == 9 && minute > 15)) {
      return 'late';
    }
    return 'present';
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Colors.green;
      case 'late':
        return Colors.orange;
      case 'absent':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return 'Present';
      case 'late':
        return 'Late';
      case 'absent':
        return 'Absent';
      default:
        return 'Unknown';
    }
  }

  IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'present':
        return Icons.check_circle;
      case 'late':
        return Icons.access_time;
      case 'absent':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  void refreshAttendance() {
    // Simulate refreshing attendance data
    Get.snackbar(
      'Refreshed',
      'Attendance data updated',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewAttendanceReport() {
    Get.toNamed('/attendance/report');
  }

  void requestAttendanceCorrection() {
    Get.toNamed('/attendance/correction');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    streamSubscription?.cancel();
  }
}
