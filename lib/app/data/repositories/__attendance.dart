import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';
import 'package:hrms_app/app/data/models/attendance/attendance_model.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../core/constants/api.dart';
import '../services/user_service.dart';

abstract class AttendanceRepository {
  Future<AttendanceModel> checkIn({String? coordinates});
  Future<AttendanceModel> checkOut({String? coordinates});
  Future<Map<String, dynamic>> getAttendanceHistory(
      {String? month, String? year});
  Future<Map<String, dynamic>> getAttendanceDetails({required String date});
}

class AttendanceRepositoryImpl extends GetConnect
    implements AttendanceRepository {
  final _logger = Logger();

  // Add headers to requests

  @override
  Future<AttendanceModel> checkIn({String? coordinates}) async {
    final headers = await sl<UserService>().getHeaders();

    final response = await post(
        Api.checkInApi,
        {
          'type': "punch_in",
          'coordinates': coordinates ??
              "26.9124,75.7873", // Default coordinates if none provided
        },
        headers: headers);

    _logger.d('Check-in API response: ${response.statusCode}');

    if (response.status.hasError) {
      final errorMessage = response.bodyString ?? 'Failed to check in';
      throw errorMessage;
    }

    final json = jsonDecode(response.bodyString ?? '{}')["data"];
    if (json != null) {
      return AttendanceModel.fromJson(json);
    }
    throw Exception('Failed to parse attendance data');
  }

  @override
  Future<AttendanceModel> checkOut({String? coordinates}) async {
    try {
      final headers = await sl<UserService>().getHeaders();

      final response = await post(
          Api.checkOutApi,
          {
            'type': "punch_out",
            'coordinates': coordinates ??
                "26.9124,75.7873", // Default coordinates if none provided
          },
          headers: headers);

      _logger.d('Check-out API response: ${response.body}');

      if (response.status.hasError) {
        final errorMessage = response.bodyString ?? 'Failed to check out';
        _logger.e('Check-out failed: $errorMessage');
        throw Exception(errorMessage);
      }

      final json = jsonDecode(response.bodyString ?? '{}')["data"];
      if (json != null) {
        return AttendanceModel.fromJson(json);
      }
      throw Exception('Failed to parse attendance data');
    } catch (e) {
      _logger.e('Error during check-out: $e');
      throw Exception('Failed to check out: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> getAttendanceHistory(
      {String? month, String? year}) async {
    try {
      final headers = await sl<UserService>().getHeaders();

      // Default to current month and year if not provided
      final now = DateTime.now();
      final selectedMonth = month ?? now.month.toString().padLeft(2, '0');
      final selectedYear = year ?? now.year.toString();

      final queryParameters = {
        'type': 'history',
        'month': selectedMonth,
        'year': selectedYear,
      };

      final response = await get(
        Api.attendanceHistoryApi,
        headers: headers,
        query: queryParameters,
      );

      _logger.d('Attendance history response: ${response.body}');

      if (response.status.hasError) {
        final errorMessage =
            response.bodyString ?? 'Failed to fetch attendance history';
        _logger.e('Get attendance history failed: $errorMessage');
        throw Exception(errorMessage);
      }

      return jsonDecode(response.bodyString ?? '{}');
    } catch (e) {
      _logger.e('Error fetching attendance history: $e');
      throw Exception('Failed to fetch attendance history: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> getAttendanceDetails(
      {required String date}) async {
    try {
      final headers = await sl<UserService>().getHeaders();

      final response = await get(
        Api.attendanceDetailsApi,
        headers: headers,
        query: {
          'date': date,
        },
      );

      _logger.d('Attendance details response: ${response.body}');

      if (response.status.hasError) {
        final errorMessage =
            response.bodyString ?? 'Failed to fetch attendance details';
        _logger.e('Get attendance details failed: $errorMessage');
        throw Exception(errorMessage);
      }

      return jsonDecode(response.bodyString ?? '{}');
    } catch (e) {
      _logger.e('Error fetching attendance details: $e');
      throw Exception('Failed to fetch attendance details: ${e.toString()}');
    }
  }
}
