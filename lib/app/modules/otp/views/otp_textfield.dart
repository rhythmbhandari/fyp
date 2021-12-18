import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class OTPTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function onChanged;
  final bool autofocus;
  final FocusNode focusNode;

  const OTPTextField(
      { Key key,
        this.textEditingController,
        this.onChanged,
        this.autofocus = false,
        this.focusNode}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffe5e2f5).withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              blurRadius: 2,
              color: Get.theme.primaryColor.withOpacity(0.41),
              spreadRadius: 0.5,
            ),
          ]),
      child: TextField(
        maxLength: 1,
        autofocus: autofocus,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: getResponsiveFont(18),
          color: Colors.black,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w600,
        ),
        controller: textEditingController,
        decoration: const InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Color(0xfff6f5fa),
          border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffe5e2f5))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffe5e2f5))),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffe5e2f5))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffe5e2f5))),
        ),
      ),
    );
  }
}
