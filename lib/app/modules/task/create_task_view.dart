import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/modules/task/create_task_controller.dart';
import 'package:logger/web.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _buildAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildShopDropdown(),
                              if (controller.isShopSelected.value) ...{
                                const SizedBox(height: 16),
                                _buildEmployeeDropdown(),
                              },
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: controller.departmentController,
                                hintText: 'Department',
                                readOnly: true,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: controller.titleController,
                                hintText: 'Task Title',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a task title';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: controller.descriptionController,
                                hintText: 'Task Description',
                                maxLines: 3,
                                focusNode: controller.descriptionFocusNode,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a task description';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildDatePicker(context),
                              const SizedBox(height: 16),
                              _buildPriorityDropdown(),
                              const SizedBox(height: 48),
                              _buildAssignButton(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Create Assign',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    FocusNode? focusNode,
    bool readOnly = false,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      onTapOutside: (event) {
        if (focusNode != null) focusNode.unfocus();
      },
      validator: validator,
    );
  }

  Widget _buildEmployeeDropdown() {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: Get.height * 0.6,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Employee',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        controller.allEmployeeController.employees.length,
                    itemBuilder: (context, index) {
                      final employee =
                          controller.allEmployeeController.employees[index];
                      return ListTile(
                        title: Text(employee.employeeName),
                        subtitle: Text(employee.designation.toUpperCase()),
                        onTap: () {
                          Logger().f(employee.toJson());
                          controller.selectEmployee(
                            employee.id,
                            employee.employeeName,
                            employee.designation.toUpperCase(),
                          );
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: TextFormField(
        controller: controller.employeeController,
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Select Employee',
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.keyboard_arrow_down, size: 28),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildShopDropdown() {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: Get.height * 0.6,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Shop',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.shopListController.shops.length,
                    itemBuilder: (context, index) {
                      final shop = controller.shopListController.shops[index];
                      return ListTile(
                        title: Text(shop.shopName ?? "Unknown Name"),
                        subtitle: Text(shop.shopAddress ?? "Unknown Address"),
                        onTap: () {
                          controller.selectShop(
                            shop.id ?? 0,
                            shop.shopName ?? "Unknown Name",
                            shop.shopAddress ?? "Unknown Address",
                          );
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: TextFormField(
        controller: controller.shopController,
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Select Shop',
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.keyboard_arrow_down, size: 28),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () => controller.selectDate(context),
      child: TextFormField(
        controller: controller.deadlineController,
        enabled: false,
        decoration: InputDecoration(
          hintText: 'mm/dd/yy',
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(
            Icons.calendar_today,
            color: Color(0xFF9CB70B),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityDropdown() {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Priority',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...controller.priorityOptions.map((priority) {
                  return ListTile(
                    title: Text(priority),
                    trailing: Obx(() =>
                        controller.selectedPriority.value == priority
                            ? const Icon(Icons.check, color: Color(0xFF9CB70B))
                            : const SizedBox()),
                    onTap: () {
                      controller.selectedPriority.value = priority;
                      Get.back();
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  controller.selectedPriority.value,
                  style: const TextStyle(fontSize: 16),
                )),
            const Icon(Icons.keyboard_arrow_down, size: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.createTask,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9CB70B),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Assign Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
