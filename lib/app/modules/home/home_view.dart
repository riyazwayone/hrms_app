import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/app_constants.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/app_utils.dart';
import '../../data/repositories/__home.dart';
import '../../data/services/user_service.dart';
import '../../global_widgets/employee_item.dart';
import 'home_controller.dart';
import 'widgets/admin_home_view.dart';
import 'widgets/employee_home_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Add listener to track scroll position
    scrollController.addListener(() {
      controller.updateScrollPosition(scrollController.offset);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: sl<UserService>().getCurrentUserSync()!.role == UserRole.admin
          ? AdminHomeView(
              controller: controller, scrollController: scrollController)
          : EmployeeHomeView(
              controller: controller, scrollController: scrollController),
    );
  }
}
