import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocationInputTextField extends StatelessWidget {
  final bool enabled;
  final IconData icon;
  final FocusNode node;
  final TextEditingController controller;
  final String hint;
  final Function onChanged;
  final onSubmit;
  final bool autofocus;
  final Widget suffix;

  LocationInputTextField(
      {this.enabled = true,
      this.icon,
      this.node,
      this.controller,
      this.hint,
      this.onSubmit,
      this.onChanged,
      this.suffix,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Get.theme.primaryColor),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                showCursor: true,
                style: Get.textTheme.bodyText2,
                enabled: enabled,
                controller: controller,
                focusNode: node,
                autofocus: autofocus,
                onSubmitted: onSubmit,
                textInputAction: TextInputAction.search,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                ),
              ),
            ),
            if (suffix != null) SizedBox(width: 8),
            if (suffix != null) suffix
          ],
        ),
      ),
    );
  }
}
