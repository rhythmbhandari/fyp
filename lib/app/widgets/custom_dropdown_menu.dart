import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quicki/app/utils/responsive_size.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String value;
  final List<String> itemList;
  final Function onChanged;
  final bool country;
  final Color color;

  const CustomDropDownMenu(
      {Key key, @required this.value,
        this.color = Colors.black,
        this.country = false,
      @required this.itemList,
      @required this.onChanged}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        style: Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: getResponsiveFont(16),
          color: Colors.black,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w600,
        ),
        value: value,
        items: itemList
            .map((item) => DropdownMenuItem(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      country ? SvgPicture.asset(
                        'svg_assets/nepal.svg',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ) : Icon( Icons.person_rounded, size: 20, color: Get.theme.primaryColor),
                      country? const SizedBox(width:8) : const SizedBox(width:8),
                      Text(
                        item,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: (color == Colors.black) ? getResponsiveFont(18) : getResponsiveFont(16),
                          color: color,
                          fontWeight: FontWeight.w600,
                          letterSpacing: color == Colors.black ? 2.0 : 1.0,
                        ),
                      ),
                    ],
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
