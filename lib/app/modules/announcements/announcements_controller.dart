import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementsController extends GetxController {
  static AnnouncementsController get to => Get.find();

  // Observable variables
  final RxList<Map<String, dynamic>> announcements = <Map<String, dynamic>>[
    {
      'id': '1',
      'title': 'Company Annual Meeting',
      'description':
          'Join us for the annual company meeting this Friday at 10:00 AM in the main conference room. We will discuss our achievements this year and plans for the upcoming year.',
      'date': '2025-08-16',
      'time': '10:00 AM',
      'priority': 'high',
      'category': 'Meeting',
      'author': 'HR Department',
      'isRead': false,
    },
    {
      'id': '2',
      'title': 'New Health Insurance Policy',
      'description':
          'We are excited to announce our new comprehensive health insurance policy. The new policy includes dental and vision coverage.',
      'date': '2025-08-14',
      'time': '09:00 AM',
      'priority': 'medium',
      'category': 'Policy',
      'author': 'Benefits Team',
      'isRead': true,
    },
    {
      'id': '3',
      'title': 'Office Renovation Notice',
      'description':
          'Office renovation will begin next week. Some areas may be temporarily inaccessible. Please plan accordingly.',
      'date': '2025-08-12',
      'time': '02:00 PM',
      'priority': 'low',
      'category': 'Facility',
      'author': 'Facility Management',
      'isRead': false,
    },
    {
      'id': '4',
      'title': 'Team Building Event',
      'description':
          'Join us for a team building event this Saturday at the local park. Food and activities will be provided.',
      'date': '2025-08-18',
      'time': '12:00 PM',
      'priority': 'medium',
      'category': 'Event',
      'author': 'HR Department',
      'isRead': false,
    },
    {
      'id': '5',
      'title': 'IT System Maintenance',
      'description':
          'The IT systems will undergo scheduled maintenance this Sunday from 2:00 AM to 6:00 AM. Some services may be unavailable.',
      'date': '2025-08-19',
      'time': '02:00 AM',
      'priority': 'high',
      'category': 'IT',
      'author': 'IT Department',
      'isRead': true,
    },
  ].obs;

  final RxList<String> categories = [
    'All',
    'Meeting',
    'Policy',
    'Event',
    'IT',
    'Facility',
  ].obs;

  final RxString selectedCategory = 'All'.obs;
  final RxList<Map<String, dynamic>> filteredAnnouncements =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredAnnouncements.assignAll(announcements);
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    filterAnnouncements();
  }

  void filterAnnouncements() {
    if (selectedCategory.value == 'All') {
      filteredAnnouncements.assignAll(announcements);
    } else {
      filteredAnnouncements.assignAll(
        announcements
            .where((announcement) =>
                announcement['category'] == selectedCategory.value)
            .toList(),
      );
    }
  }

  void markAsRead(String announcementId) {
    final index = announcements
        .indexWhere((announcement) => announcement['id'] == announcementId);

    if (index != -1) {
      announcements[index]['isRead'] = true;
      filterAnnouncements(); // Refresh filtered list
    }
  }

  void viewAnnouncementDetails(Map<String, dynamic> announcement) {
    // Mark as read when viewing
    markAsRead(announcement['id']);

    Get.toNamed('/announcements/details', arguments: announcement);
  }

  Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'meeting':
        return Icons.groups;
      case 'policy':
        return Icons.policy;
      case 'event':
        return Icons.event;
      case 'it':
        return Icons.computer;
      case 'facility':
        return Icons.business;
      default:
        return Icons.announcement;
    }
  }

  int get unreadCount {
    return announcements
        .where((announcement) => !announcement['isRead'])
        .length;
  }

  void refreshAnnouncements() {
    // Simulate API call to refresh announcements
    Get.snackbar(
      'Refreshed',
      'Announcements updated',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
