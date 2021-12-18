import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class PhoneInputField extends StatelessWidget {
  final bool autoFocus;
  final Widget prefix;
  final Function onChanged;
  final String errorText;
  final String labelText;
  final Function onSubmit;
  final TextEditingController controller;

  const PhoneInputField(
      {Key key, this.autoFocus = false,
        this.onSubmit,
        this.labelText,
        this.errorText,
        this.prefix,
        this.onChanged,
        this.controller}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      autofocus: true,
      controller: controller,
      onSubmitted: onSubmit,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
      ],
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
        fontSize: getResponsiveFont(18),
        color: Colors.black,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(
            color: errorText == null
                ? Theme.of(context).primaryColor
                : Colors.red),
        errorText: errorText,
        contentPadding: const EdgeInsets.only(bottom: -8, left: 16, right: 16),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey[600]),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey[600]),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        prefix: (prefix == null) ? Container() : prefix,
      ),
    );
  }
}
