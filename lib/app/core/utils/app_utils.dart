import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  // Show loading dialog
  static void showLoading({String? message}) {
    Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                message ?? 'Loading...',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static anyToBool(dynamic text) {
    if (text is bool) return text;

    final stringValue = text.toString().toLowerCase().trim();

    switch (stringValue) {
      case 'true':
      case 'yes':
      case '1':
        return true;
      case 'false':
      case 'no':
      case '0':
        return false;

      default:
        return bool.tryParse(stringValue) ?? false;
    }
  }

  // Hide loading dialog
  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  // Show success snackbar
  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  // Show error snackbar
  static void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  static anyToDouble(dynamic text) {
    if (text == null) return 0.0;
    if (text is double) return text;
    if (text is int) return text.toDouble();

    // Handle string conversion
    if (text is String) {
      if (text.trim().isEmpty) return 0.0;
      return double.tryParse(text.trim()) ?? 0.0;
    }

    // Try converting to string first, then parse
    final stringValue = text.toString().trim();
    if (stringValue.isEmpty || stringValue == 'null') return 0.0;

    return double.tryParse(stringValue) ?? 0.0;
  }

  // Show info snackbar
  static void showInfo(String message) {
    Get.snackbar(
      'Info',
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  // Show warning snackbar
  static void showWarning(String message) {
    Get.snackbar(
      'Warning',
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  // Format date
  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Format time
  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  // Format currency
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  // Validate email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Validate phone number
  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(phone);
  }

  // Generate random string
  static String generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
            (chars.length * DateTime.now().millisecondsSinceEpoch) %
                chars.length),
      ),
    );
  }

  // Check if string is empty or null
  static bool isNullOrEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  // Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // Get initials from name
  static String getInitials(String name) {
    List<String> nameParts = name.trim().split(' ');
    String initials = '';

    for (int i = 0; i < nameParts.length && i < 2; i++) {
      if (nameParts[i].isNotEmpty) {
        initials += nameParts[i][0].toUpperCase();
      }
    }

    return initials;
  }

  // Convert bytes to readable format
  static String formatBytes(int bytes) {
    if (bytes <= 0) return '0 B';

    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    int i = 0;
    double size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(2)} ${suffixes[i]}';
  }

  // Show confirmation dialog
  static Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    bool result = false;

    await Get.defaultDialog(
      title: title,
      middleText: message,
      onConfirm: () {
        result = true;
        Get.back();
      },
      onCancel: () {
        result = false;
      },
      textConfirm: confirmText,
      textCancel: cancelText,
    );

    return result;
  }

  // Converter functions for TimeOfDay
  static TimeOfDay? timeFromString(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return null;

    final parts = timeStr.split(':');
    if (parts.length < 2) return null;

    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static DateTime anyToDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }

  static Duration? anyToDuration(dynamic value) {
    try {
      if (value == null) return null;

      if (value is Duration) return value;

      if (value is DateTime) return DateTime.now().difference(value);

      if (value is int) {
        // treat as seconds (common) — if you store milliseconds adjust accordingly
        return Duration(seconds: value);
      }

      if (value is String) {
        // Try full date-time parse first
        try {
          final dt = DateTime.parse(value);
          return DateTime.now().difference(dt);
        } catch (_) {
          // If time-only string, return Duration representing that time of day
          final parsed = parseTimeOnly(value);
          if (parsed != null) {
            return Duration(
              hours: parsed.hour,
              minutes: parsed.minute,
              seconds: parsed.second,
            );
          }
        }
      }
    } catch (_) {
      // fallthrough
    }
    return Duration.zero;
  }

  // Helper to parse time-only strings like "17:27" or "17:27:06"
  static Hms? parseTimeOnly(String s) {
    final regex = RegExp(r'^(\d{1,2}):(\d{2})(?::(\d{2}))?$');
    final m = regex.firstMatch(s.trim());
    if (m == null) return null;
    try {
      final hour = int.parse(m.group(1)!);
      final minute = int.parse(m.group(2)!);
      final second = m.group(3) != null ? int.parse(m.group(3)!) : 0;
      if (hour < 0 ||
          hour > 23 ||
          minute < 0 ||
          minute > 59 ||
          second < 0 ||
          second > 59) return null;
      return Hms(hour, minute, second);
    } catch (_) {
      return null;
    }
  }

  static DateTime durationToTimestamp(Duration duration) {
    final now = DateTime.now();
    final timestamp = now.subtract(duration);
    return timestamp;
  }

  static String extractErrorMessage(dynamic e) {
    try {
      if (e is Map<String, dynamic>) {
        return (e['message'] ?? e['error'] ?? e['detail'] ?? e).toString();
      } else if (e is String) {
        final trimmed = e.trim();

        // 🔍 Find the first JSON object in the string (supports newlines)
        final regex = RegExp(r'\{[^}]*\}', dotAll: true, multiLine: true);
        final match = regex.firstMatch(trimmed);

        if (match != null) {
          final jsonPart = match.group(0)!;
          try {
            final decoded = jsonDecode(jsonPart);
            if (decoded is Map<String, dynamic>) {
              return (decoded['message'] ??
                      decoded['error'] ??
                      decoded['detail'] ??
                      decoded)
                  .toString();
            }
          } catch (_) {
            // If JSON parsing fails, fall back
          }
        }

        return trimmed; // fallback to raw string
      } else {
        return e.toString(); // Exception or other type
      }
    } catch (_) {
      return 'An unexpected error occurred';
    }
  }

  static List<Duration>? parseTimeRangeToDurations(String? range) {
    if (range == null || range.isEmpty) return null;
    // Support both "-" and "to"
    final parts = range.contains('-')
        ? range.split('-')
        : range.split(RegExp(r'\s+to\s+', caseSensitive: false));

    if (parts.length != 2) {
      throw FormatException("Invalid time range format: $range");
    }

    Duration parseTime(String timeStr) {
      final trimmed = timeStr.trim();
      final regex =
          RegExp(r'^(\d{1,2})(?::(\d{2}))?\s*(AM|PM)$', caseSensitive: false);
      final match = regex.firstMatch(trimmed);

      if (match == null) {
        throw FormatException("Invalid time format: $trimmed");
      }

      int hour = int.parse(match.group(1)!);
      final minute = match.group(2) != null ? int.parse(match.group(2)!) : 0;
      final meridian = match.group(3)!.toUpperCase();

      if (meridian == "PM" && hour != 12) {
        hour += 12;
      } else if (meridian == "AM" && hour == 12) {
        hour = 0;
      }

      return Duration(hours: hour, minutes: minute);
    }

    final start = parseTime(parts[0]);
    final end = parseTime(parts[1]);

    return [start, end];
  }
}

// Helper class to hold hour, minute, second
class Hms {
  final int hour;
  final int minute;
  final int second;
  Hms(this.hour, this.minute, this.second);
}
