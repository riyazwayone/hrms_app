import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final role = sl<UserService>().getRole();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo and welcome text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppConstants.logo)),
                        ),
                      ),
                    ),
                    Text(
                      'Welcome Back!',
                      style: AppTextStyles.welcome,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue to your HRMS account',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // Email field
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AppConstants.mailSvg,
                          colorFilter: ColorFilter.mode(
                              AppColors.primary, BlendMode.srcIn)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Password field
                Obx(() => TextFormField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      validator: controller.validatePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppConstants.lockSvg,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primary, BlendMode.srcIn)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    )),

                const SizedBox(height: 16),

                // Remember me and forgot password
                Row(
                  children: [
                    Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (_) => controller.toggleRememberMe(),
                        )),
                    Text(
                      'Remember me',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: controller.goToForgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.linkText,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Login button
                Obx(() => ElevatedButton(
                      onPressed: controller.isLoading.value || role == null
                          ? null
                          : () => controller.login(role),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.textOnPrimary,
                                ),
                              ),
                            )
                          : const Text('Sign In'),
                    )),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 24),
                // Social login buttons
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: .5,
                        color: AppColors.borderDark,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppConstants.googleLogo,
                        width: 32,
                        height: 32,
                      ),
                      Gap(10),
                      Text("Continue with Google")
                    ],
                  ),
                ),

                // Sign up link
                Builder(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: AppTextStyles.bodyMedium,
                      ),
                      TextButton(
                        onPressed: controller.goToRegister,
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.linkText,
                        ),
                      ),
                    ],
                  );
                }).forAdmin(role: role),
                const SizedBox(height: 32),
              ].whereType<Widget>().toList(),
            ),
          ),
        ),
      ),
    );
  }
}
