import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final Function onSubmit;
  final FocusNode focusNode;
  final bool enabled;
  final Function onChanged;
  final String errorText;
  final Function onTap;
  final bool autoFocus;
  final bool obscureText;
  final Widget suffix;
  final TextEditingController textController;

  const CustomTextField(
      {Key key, this.label,
        this.autoFocus = false,
        this.textController,
        this.errorText,
        this.onTap,
        this.onChanged,
        this.suffix,
        this.inputType,
        this.obscureText = false,
        this.enabled = true,
        this.onSubmit,
        this.focusNode}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(accentColor: Colors.redAccent,colorScheme: ThemeData().colorScheme.copyWith(
        secondary: Colors.red,
      ),),
      child: TextField(
        autofocus: autoFocus,
        focusNode: focusNode,
        onSubmitted: onSubmit,
        keyboardType: inputType,
        enabled: enabled,
        onTap: onTap,
        onChanged: onChanged,
        obscureText: obscureText,
        controller: textController,
        cursorColor: Theme.of(context).accentColor,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: getResponsiveFont(16),
          color: Colors.black,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_rounded, size: 20, color: Get.theme.primaryColor),
          filled: true,
          fillColor: const Color(0xfff4f5fe),
          suffixIcon: suffix,
          errorText: errorText,
          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
            fontSize: getResponsiveFont(16),
            color:
            errorText == null ? Colors.grey[600] : Colors.red,
            letterSpacing:1.0,
            fontWeight: FontWeight.w600,
          ),
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xfff4f5fe),
                width: 0.1,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 0.1,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0.1,
                color: Color(0xfff4f5fe),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0.1,
                color: Color(0xfff4f5fe),
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0.1,
                color: Color(0xfff4f5fe),
              )),
        ),
      ),
    );
  }
}
