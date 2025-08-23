import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_gaps.dart';
import 'package:sizer_pro/sizer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Obx(
                () => ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Gap(AppGaps.topGap),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 45.h,
                            ),
                            Positioned(
                              bottom: 50,
                              right: -200,
                              left: -300,
                              child: AnimatedContainer(
                                height: 50.h,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeOutBack,
                                decoration: BoxDecoration(
                                  image: controller.currentImages.isNotEmpty
                                      ? DecorationImage(
                                          image: AssetImage(controller
                                                  .currentImages[
                                              controller.currentPage.value]),
                                          fit: BoxFit.fitWidth,
                                        )
                                      : null,
                                ),
                                transform: Matrix4.identity()
                                  ..scale(1.4 -
                                      (controller.currentPage.value *
                                          0.02)) // 1.3 -> 1.1 -> 0.9
                                  ..translate(
                                    (controller.currentPage.value * 20)
                                        .toDouble(),
                                    (controller.currentPage.value * 20)
                                        .toDouble(),
                                  ),
                              ),
                            ),
                          ],
                        ),
                        Gap(AppGaps.medium),
                        Expanded(
                          child: Container(
                            height: 23.h,
                            padding: const EdgeInsets.all(24.0),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 600),
                              transitionBuilder: (child, animation) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.3),
                                    end: Offset.zero,
                                  ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOut,
                                  )),
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  key: ValueKey(controller.currentPage.value),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.currentTitles.isNotEmpty)
                                      Text(
                                        controller.currentTitles[
                                            controller.currentPage.value],
                                        style: AppTextStyles.h4,
                                      ),
                                    Gap(8),
                                    if (controller
                                        .currentDescriptions.isNotEmpty)
                                      Text(
                                        controller.currentDescriptions[
                                            controller.currentPage.value],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (controller.currentPage.value > 0)
                          ElevatedButton(
                            onPressed: () {
                              controller
                                  .selectRole(controller.selectedRole.value);
                              controller.nextPage();
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ).paddingSymmetric(horizontal: 20),
                        if (controller.currentPage.value < 1) ...{
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.gray, width: 1),
                                  ),
                                  onPressed: () {
                                    controller.selectRole("HR");
                                    controller.nextPage();
                                  },
                                  child: Text(
                                    "I’m a HR",
                                    style:
                                        TextStyle(color: AppColors.textPrimary),
                                  ),
                                ),
                              ),
                              Gap(AppGaps.small),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.gray, width: 1),
                                  ),
                                  onPressed: () {
                                    controller.selectRole("Employee");

                                    controller.nextPage();
                                  },
                                  child: Text(
                                    "I’m an Employee",
                                    style:
                                        TextStyle(color: AppColors.textPrimary),
                                  ),
                                ),
                              )
                            ],
                          ).paddingSymmetric(horizontal: 20),
                          Gap(AppGaps.medium),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.gray, width: 1),
                                  ),
                                  onPressed: () {
                                    controller.selectRole("Admin");
                                    controller.nextPage();
                                  },
                                  child: Text(
                                    "I’m a Shop owner",
                                    style:
                                        TextStyle(color: AppColors.textPrimary),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20),
                        },
                        Gap(AppGaps.medium),
                        if (controller.currentPage.value > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.totalPages,
                              (index) => index == 0
                                  ? SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: index ==
                                                controller.currentPage.value
                                            ? AppColors.primary
                                            : Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: Colors.white,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index ==
                                                      controller
                                                          .currentPage.value
                                                  ? AppColors.primary
                                                  : AppColors.gray,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        Gap(AppGaps.large)
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Widget hrStepOne() {
    return Column(
      children: [
        Gap(AppGaps.topGap),
        Stack(
          clipBehavior: Clip.none, // allow overflow for transition
          children: [
            SizedBox(height: 50.h), // base space for layout

            Positioned(
              left: -100.w, // move left for partial cut effect
              right: -100.w, // extend beyond screen edge
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        controller.currentImages[controller.currentPage.value]),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(AppGaps.medium),
        Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.currentTitles[controller.currentPage.value],
                  style: AppTextStyles.h4),
              Text(controller.currentDescriptions[controller.currentPage.value])
            ],
          ),
        ),
        Gap(AppGaps.medium),
        ElevatedButton(
                onPressed: () => controller.nextPage(), child: Text("Next"))
            .paddingSymmetric(
          horizontal: 20,
        ),
        Gap(AppGaps.medium),
        Row(
          children: List.generate(
            controller.totalPages,
            (index) => CircleAvatar(
              backgroundColor: index == controller.currentPage.value
                  ? AppColors.primary
                  : AppColors.gray,
            ),
          ),
        )
      ],
    );
  }
}
