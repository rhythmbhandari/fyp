import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  final Function onTap;
  final bool rightBorder;
  final bool leftBorder;
  final bool bottomBorder;
  final bool topBorder;

  CustomIconButton(
      {@required this.iconUrl,
      this.bottomBorder = false,
      this.topBorder = false,
      this.rightBorder = false,
      this.leftBorder = false,
      @required this.title,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: leftBorder ? 16 : 0,
          top: topBorder ? 16 : 0,
          right: rightBorder ? 16 : 0,
          bottom: bottomBorder ? 16 : 0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              blurRadius: 2.0,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.8,
            ),
          ]
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                ),
                child: Image.asset(
                  iconUrl,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
