import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/trip/controllers/trip_controller.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class TripRunningDialog extends GetView<TripController> {

  final PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _pc,
      minHeight: Get.height * 0.1,
      maxHeight: Get.height * 0.5,
      renderPanelSheet: false,
      defaultPanelState: PanelState.OPEN,
      panel: _floatingPanel(),
      onPanelOpened: (){
        controller.setGooglePadding(Get.height * 0.5);
      },
      onPanelClosed: (){
        controller.setGooglePadding(Get.height * 0.1);
      },
      collapsed: _floatingCollapsed(),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            width: Get.width,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container()
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rhythm Bhandari',
                        style: Get.textTheme.headline5,
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () async {
                          if (await canLaunch(
                              'tel: ${9869191572}')) {
                            await launch('tel:${9869191572}');
                          } else {
                            throw 'Could not launch url';
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Get.theme.primaryColor,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text("Call",
                                style: Get.textTheme.bodyText2
                                    .copyWith(color: Get.theme.primaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text('Ba 2 Kha 2020', style: Get.textTheme.bodyText2,),
          SizedBox(height: 8),
          Text('BIKE'),
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
                  child: Text(
                    "Sanepa",
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
                        "Rs" +
                            // ' ${controller.booking.price}',
                            '200',
                        style: Get.textTheme.headline6,
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
        ],
      ),
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
            'Towards the destination...',
            style: Get.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}