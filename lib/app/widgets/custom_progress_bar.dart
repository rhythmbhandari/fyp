import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: size.width,
        color: Colors.white.withOpacity(0.4),
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
        ),
      );
  }
}