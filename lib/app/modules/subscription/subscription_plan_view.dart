import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/data/models/subscription/subscription_plan_model.dart';
import 'package:hrms_app/app/modules/subscription/subscription_plan_controller.dart';

import '../../data/models/subscription/plan_model.dart';

class SubscriptionPlanView extends GetView<SubscriptionPlanController> {
  const SubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Choose Your Subscription Plan',
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.plans.length,
                  itemBuilder: (context, index) {
                    final plan = controller.plans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildPlanCard(plan),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: controller.goToSubscriptionDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Subscribe',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPlanCard(PlanModel plan) {
    return Obx(() {
      final isSelected = controller.selectedPlan.value?.id == plan.id;

      return GestureDetector(
        onTap: () => controller.selectPlan(plan),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
              width: isSelected ? 2.0 : 1.0,
            ),
          ),
          elevation: isSelected ? 3 : 1,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plan.planName,
                          style: AppTextStyles.h4,
                        ),
                        if (plan.isRecommended!)
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: plan.isRecommended!
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Text(
                              plan.isRecommended!
                                  ? 'Most Bought'
                                  : 'Recommended',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: plan.isRecommended!
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₹ ${plan.price.toInt()}',
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildFeatureItem(
                      "You create a ${plan.shopNumber} shop",
                      isPositive: true,
                    ),
                    _buildFeatureItem(
                      "Add on maximum ${plan.employeeLimit} users",
                      isPositive: true,
                    ),
                    // // Features
                    // ...plan.features.map((feature) => _buildFeatureItem(
                    //       feature,
                    //       isPositive: true,
                    //     )),
                    // // Negative Features
                    // ...plan.negativeFeatures.map((feature) => _buildFeatureItem(
                    //       feature,
                    //       isPositive: false,
                    //     )),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildFeatureItem(String feature, {required bool isPositive}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            isPositive ? Icons.check : Icons.close,
            color: isPositive ? AppColors.primary : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(
                fontSize: 14,
                color: isPositive ? AppColors.textPrimary : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
