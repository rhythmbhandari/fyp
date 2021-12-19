import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAndWorkLocationTile extends StatelessWidget {

  final Widget suffix;

  HomeAndWorkLocationTile({this.suffix});

  @override
  Widget build(BuildContext context) {
    return Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // if (controller.homeLocation == null) {
                  //   controller.addHomeAndWorkTask(LocationType.HOME);
                  // } else {
                  //   if (pickUpNode.hasFocus) {
                  //     controller.setLocationToHolder(LocationType.HOME, LocationType.PICKUP);
                  //   } else {
                  //     controller.setLocationToHolder(LocationType.HOME, LocationType.DESTINATION);
                  //   }
                  //   controller.showOnMap();
                  // }
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: Icon(
                          Icons.home,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Home",
                                style: Get.textTheme.headline5
                                    .copyWith(fontSize: 14)),
                            Text('Home Address',
                                // controller.homeName == null
                                //     ? 'set_home_address'.tr
                                //     : controller.homeName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.bodyText2.copyWith(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.grey.withOpacity(0.3),
              ),
              InkWell(
                onTap: () {
                  // if (controller.workLocation == null) {
                  //   controller.addHomeAndWorkTask(LocationType.WORK);
                  // } else {
                  //   if (pickUpNode.hasFocus) {
                  //     controller.setLocationToHolder(LocationType.WORK, LocationType.PICKUP);
                  //   } else {
                  //     controller.setLocationToHolder(LocationType.WORK, LocationType.DESTINATION);
                  //   }
                  //   controller.showOnMap();
                  // }
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: Icon(
                          Icons.work,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Work',
                                style: Get.textTheme.headline5
                                    .copyWith(fontSize: 14)),
                            Text('Work Address',
                                // controller.workName == null
                                //     ? 'set_work_address'.tr
                                //     : controller.workName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.bodyText2.copyWith(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
