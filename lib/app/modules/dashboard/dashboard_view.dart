import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/app_constants.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/modules/dashboard/dashboard_controller.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_view.dart';
import 'package:hrms_app/app/modules/home/home_view.dart';
import 'package:hrms_app/app/modules/profile/profile_view.dart';
import 'package:hrms_app/app/modules/shop/shop_list/shop_list_view.dart';
import 'package:hrms_app/app/modules/task/task_list_view.dart';

import '../../core/theme/app_colors.dart';

class DashboardNavScreen extends GetView<DashboardController> {
  const DashboardNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          HomeView(),
          ShopListView().forAdmin(),
          TaskListView(),
          AllEmployeesView(),
          ProfileView()
        ].whereType<Widget>().toList(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(controller.navbarLabels.length, (index) {
              return _buildNavItem(
                controller.navbarLabels[index],
                controller.navbarIcons[index],
                controller.selectedIndex.value == index,
                index,
              );
            }),
          )),
    );
  }

  Widget _buildNavItem(String title, String svg, bool isActive, int index) {
    return InkWell(
      onTap: () => controller.changeTabIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svg,
            colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : Colors.grey, BlendMode.srcIn),
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.primary : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
