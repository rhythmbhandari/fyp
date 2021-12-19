import 'package:flutter/material.dart';

class NavSettings extends StatelessWidget {
  final Function onTap;

  NavSettings({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          // color: Color(0xff457B9D),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
