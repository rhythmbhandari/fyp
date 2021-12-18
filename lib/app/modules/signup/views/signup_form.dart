import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/signup/controllers/signup_controller.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_dropdown_menu.dart';
import 'package:quicki/app/widgets/custom_textfield.dart';

class SignUpForm extends GetView<SignupController> {
  final FocusNode lastNameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: CustomTextField(
              textController: controller.firstNameController,
              label: "First Name",
              onChanged: (_) {
                controller.checkFormFilled();
              },
              onSubmit: (_) => node.requestFocus(lastNameNode),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              focusNode: lastNameNode,
              onChanged: (_) {
                controller.checkFormFilled();
              },
              textController: controller.lastNameController,
              label: "Last Name",
              onSubmit: (_) => node.requestFocus(emailNode),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      CustomTextField(
        label: "Email",
        textController: controller.emailController,
        focusNode: emailNode,
        onChanged: (_) {
          controller.checkFormFilled();
        },
        inputType: TextInputType.emailAddress,
        onSubmit: (_) => node.requestFocus(passwordNode),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Obx(
                      () => Container(
                        padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color:  const Color(0xfff4f5fe),
                          border: Border.all(color: const Color(0xfff4f5fe),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomDropDownMenu(
                          color: Colors.grey[900],
                            value: controller.selectedGender.value,
                            itemList: controller.genderList,
                            onChanged: (value) {
                              controller.updateGender(value);
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                cancelStyle: Get.textTheme.headline5
                                    .copyWith(color: Get.theme.primaryColor),
                                doneStyle: Get.textTheme.headline5
                                    .copyWith(color: Get.theme.accentColor),
                                containerHeight: Get.height * 0.2,
                                itemHeight: 40,
                                itemStyle: Get.textTheme.bodyText2
                                    .copyWith(fontSize: 16),
                              ),
                              showTitleActions: true,
                              minTime: DateTime(1940, 3, 5),
                              maxTime: DateTime.now().add(const Duration(days: -365 * 18)), onConfirm: (date) {
                            controller.updateDob(date);
                          },
                              onCancel: () {},
                              currentTime: controller.dob ?? DateTime.now().add(const Duration(days: -365 * 18)),
                              locale: LocaleType.en);
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          decoration: BoxDecoration(
                            color:const Color(0xfff4f5fe),
                            border: Border.all(color: const Color(0xfff4f5fe)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon( Icons.person_rounded, size: 20, color: Get.theme.primaryColor),
                              const SizedBox(width:8),
                              Text(controller.dateOfBirth, style:Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: getResponsiveFont(16),
                                color: Colors.black,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w600,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
