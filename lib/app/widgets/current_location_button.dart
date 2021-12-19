import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentLocationButton extends StatelessWidget {

  final Function onPressed;

  CurrentLocationButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
                icon: Icon(Icons.my_location, color: Colors.black),
                onPressed: onPressed),
          ),
        ),
      ],
    );
  }
}
