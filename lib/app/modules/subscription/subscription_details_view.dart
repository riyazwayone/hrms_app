import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/modules/subscription/subscription_details_controller.dart';

class SubscriptionDetailsView extends GetView<SubscriptionDetailsController> {
  const SubscriptionDetailsView({super.key});

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
        title: Obx(() {
          final planName =
              controller.selectedPlan.value?.planName ?? 'Plan Details';
          return Text(
            planName,
            style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
          );
        }),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.isPaymentProcessing.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Processing payment...'),
                SizedBox(height: 8),
                Text('Please do not close this screen',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        }

        if (controller.isPaymentVerifying.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Verifying payment...'),
                SizedBox(height: 8),
                Text('Please wait while we confirm your payment',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        }

        final plan = controller.selectedPlan.value;
        if (plan == null) {
          return const Center(child: Text('No plan selected'));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price section
                Row(
                  children: [
                    Text(
                      '₹ ${plan.price.toInt()}',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  'There are many variations of passages of Lorem Ipsum available.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),

                const Gap(32),

                // Plan images
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Left card
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // PRO badge
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'PRO',
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              // Content
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 8,
                                      color: Colors.grey.shade300,
                                    ),
                                    const Gap(8),
                                    Container(
                                      width: 60,
                                      height: 8,
                                      color: Colors.grey.shade300,
                                    ),
                                    const Gap(16),
                                    Container(
                                      width: 90,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Right card
                      Positioned(
                        right: 30,
                        bottom: 30,
                        child: Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 8,
                                  color: Colors.grey.shade300,
                                ),
                                const Gap(8),
                                Container(
                                  width: 60,
                                  height: 8,
                                  color: Colors.grey.shade300,
                                ),
                                const Gap(16),
                                Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Gold coin
                      Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFD700),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.nightlight_round,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(32),

                // Features section
                Text(
                  'Features',
                  style: AppTextStyles.h4,
                ),
                const Gap(16),
                _buildFeatureItem(
                  "You create a ${plan.shopNumber} shop",
                  isPositive: true,
                ),
                _buildFeatureItem(
                  "Add on maximum ${plan.employeeLimit} users",
                  isPositive: true,
                ),
                // Features list
                // ...plan.features.map((feature) => _buildFeatureItem(
                //       feature,
                //       isPositive: true,
                //     )),
                // ...plan.negativeFeatures.map((feature) => _buildFeatureItem(
                //       feature,
                //       isPositive: false,
                //     )),

                const Gap(32),

                // Terms & Conditions
                Text(
                  'Terms & Conditions',
                  style: AppTextStyles.h4,
                ),
                const Gap(8),
                Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),

                const Gap(16),

                // Terms acceptance checkbox
                Row(
                  children: [
                    Obx(() => Checkbox(
                          value: controller.acceptTerms.value,
                          onChanged: (_) => controller.toggleTermsAcceptance(),
                          activeColor: AppColors.primary,
                        )),
                    Expanded(
                      child: Text(
                        'I have read and agree to the Terms and Conditions',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(24),

                // Subscribe button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.subscribeToPlan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Next to Pay',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const Gap(32),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildFeatureItem(String feature, {required bool isPositive}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              isPositive ? Icons.check : Icons.close,
              color: isPositive ? AppColors.primary : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 12.0),
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
