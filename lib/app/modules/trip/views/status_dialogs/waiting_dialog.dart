import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/trip/controllers/trip_controller.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_button.dart';
import 'package:quicki/app/widgets/sliding_up_panel.dart';

import '../cancel_dialog.dart';

class WaitingDialog extends StatefulWidget {
  @override
  State<WaitingDialog> createState() => _WaitingDialogState();
}

class _WaitingDialogState extends State<WaitingDialog>
    with SingleTickerProviderStateMixin {
  final TripController controller = Get.find();

  AnimationController _animationController;
  Animation _animation;
  final PanelController _pc = new PanelController();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          controller: _pc,
          minHeight: Get.height * 0.1,
          maxHeight: Get.height * 0.45,
          renderPanelSheet: false,
          defaultPanelState: PanelState.CLOSED,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black12,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/motorcycle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: _animation.value,
                          spreadRadius: _animation.value)
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 3,
              width: 40,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Searching for riders...',
            style: Get.textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.transparent,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _floatingCollapsed(),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.7),
          ),
          SizedBox(height: 16),
          Text(
            'Trip Detail',
            style: Get.textTheme.headline5,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.my_location),
              SizedBox(width: 16),
              Expanded(
                  child: Text("Sanepa",
                style: Get.textTheme.bodyText2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_pin),
              SizedBox(width: 16),
              Expanded(
                  child: Text(
                "Kalanki",
                style: Get.textTheme.bodyText2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.receipt),
              SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   "Rs" + ' ${200}',
                    style: Get.textTheme.headline6.copyWith(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'This is the estimated fare. It may vary.',
                    style: Get.textTheme.bodyText2
                        .copyWith(fontSize: getResponsiveFont(12)),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: Get.width,
            child: CustomButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return CancelDialog();
                    });
              },
              text: 'Cancel',
            ),
          ),
        ],
      ),
    );
  }
}
