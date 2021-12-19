import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quicki/app/enum/location_type.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';

import 'home_and_work_location_tile.dart';
import 'location_input_text_field.dart';

class UserLocationInputScreen extends StatefulWidget {
  @override
  State<UserLocationInputScreen> createState() =>
      _UserLocationInputScreenState();
}

class _UserLocationInputScreenState extends State<UserLocationInputScreen> {
  BookingController controller = Get.find();
  final FocusNode pickUpNode = FocusNode();
  final FocusNode destinationNode = FocusNode();
  FocusScopeNode node;

  void backPressed() {
    Get.back();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1)).then((_) => setDestinationFocus());
  }

  setDestinationFocus() {
    print('I am setDestination===');
    print('Node is=== $node');
    print('I am destinationNode===');
    node.requestFocus(destinationNode);
  }

  @override
  Widget build(BuildContext context) {
    print('ui component===');
    node = FocusScope.of(context);
    // controller.focusedNode.value = destinationNode;
    // controller.setHomeAndWorkAddress();
    // controller.setPickupControllerValue();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            int sensitivity = 12;
            if (details.delta.dy > sensitivity) {
              // Down Swipe
              print('Down');
              Navigator.pop(context);
            } else if (details.delta.dy < -sensitivity) {
              // Up Swipe
            }
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // TextField(
                //   onTap: () {
                //     if (!pickUpNode.hasFocus) {
                //       controller.updatePredictionList([]);
                //     }
                //   },
                //
                //   style: Get.textTheme.bodyText2,
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(Icons.my_location),
                //     suffix: GestureDetector(
                //       child: Icon(
                //         Icons.close,
                //       ),
                //       onTap: () {
                //         controller.pickupInputController.text = '';
                //         controller.updatePredictionList([]);
                //       },
                //     ),
                //     hintText: LocaleKeys.hints_search_pickup.tr,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         width: 2,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         width: 2,
                //       ),
                //     ),
                //   ),
                // ),
                Card(
                    shape: RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          LocationInputTextField(
                            node: pickUpNode,
                            controller: controller.pickupInputController,
                            icon: Icons.person,
                            hint: "Seach pickup",
                            onChanged: (input) {
                              controller.getPredictions(input);
                              // controller.focusedNode.value = pickUpNode;
                            },
                            onSubmit: (_) {
                              pickUpNode.requestFocus();
                              SystemChannels.textInput.invokeMethod('TextInput.hide');
                            },
                            suffix: GestureDetector(
                              onTap: () {
                                if (pickUpNode.hasFocus) {
                                  setState(() {
                                    controller.pickupInputController.text =
                                        '';
                                  });
                                  // controller.focusedNode.value = pickUpNode;
                                  controller.updatePredictionList([]);
                                } else {
                                  node.requestFocus(pickUpNode);
                                  // controller.focusedNode.value = pickUpNode;
                                }
                              },
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Hero(
                            tag: 'destinationInput',
                            child: LocationInputTextField(
                              node: destinationNode,
                              controller: controller.destinationInputController,
                              icon: Icons.location_pin,
                              hint: "Search destination",
                              onChanged: (input) {
                                controller.getPredictions(input);
                                // controller.focusedNode.value = destinationNode;
                              },
                              onSubmit: (_) {
                                destinationNode.requestFocus();
                                SystemChannels.textInput.invokeMethod('TextInput.hide');
                              },
                              suffix: GestureDetector(
                                onTap: () {
                                  if (destinationNode.hasFocus) {
                                    setState(() {
                                      controller
                                          .destinationInputController.text = '';
                                    });
                                    // controller.focusedNode.value = destinationNode;
                                    controller.updatePredictionList([]);
                                  } else {
                                    node.requestFocus(destinationNode);
                                    // controller.focusedNode.value = destinationNode;
                                  }
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 16),
                Hero(
                  tag: 'homeAndWork',
                  child: Container(
                    child: HomeAndWorkLocationTile(),
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {
                      if (pickUpNode.hasFocus) {
                        controller.searchByPinTask(LocationType.PICKUP);
                      } else {
                        controller.searchByPinTask(LocationType.DESTINATION);
                      }
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.push_pin_outlined),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text("Search by pin")),
                        ],
                      ),
                    ),
                  ),
                ),
                // TextField(
                //   onTap: () {
                //     if (!destinationNode.hasFocus) {
                //       controller.updatePredictionList([]);
                //     }
                //   },
                //   autofocus: true,
                //   focusNode: destinationNode,
                //   onChanged: (input) {
                //     controller.getPredictions(input);
                //   },
                //   style: Get.textTheme.bodyText2,
                //   controller: controller.destinationInputController,
                //   decoration: InputDecoration(
                //     hintText: LocaleKeys.hints_search_destination.tr,
                //     suffix: GestureDetector(
                //       child: Icon(
                //         Icons.close,
                //       ),
                //       onTap: () {
                //         controller.destinationInputController.text = '';
                //         controller.updatePredictionList([]);
                //       },
                //     ),
                //     prefixIcon: Icon(Icons.location_pin),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         width: 2,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         width: 2,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16),
                // controller.predictionList.length == 0
                //     ? Column(
                //   children: [
                //     Card(
                //       margin: EdgeInsets.zero,
                //       child: InkWell(
                //         onTap: () {
                //           // if (controller.homeLocation == null) {
                //           //   controller.addHomeAndWorkTask(LocationType.HOME);
                //           // } else {
                //           //   if (pickUpNode.hasFocus) {
                //           //     controller.setLocationToHolder(LocationType.HOME, LocationType.PICKUP);
                //           //   } else {
                //           //     controller.setLocationToHolder(LocationType.HOME, LocationType.DESTINATION);
                //           //   }
                //           //   controller.showOnMap();
                //           // }
                //           Get.back();
                //         },
                //         child: Container(
                //           padding: EdgeInsets.all(8),
                //           margin: EdgeInsets.all(8),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.all(4),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(30),
                //                   color: Colors.grey.withOpacity(0.4),
                //                 ),
                //                 child: Icon(
                //                   Icons.home,
                //                   size: 20,
                //                 ),
                //               ),
                //               SizedBox(width: 8),
                //               Expanded(
                //                 child: Column(
                //                   crossAxisAlignment:
                //                   CrossAxisAlignment.start,
                //                   children: [
                //                     Text(LocaleKeys.bottom_navigation_items_home.tr,
                //                         style: Get.textTheme.headline5
                //                             .copyWith(fontSize: 14)),
                //                     Text(
                //                         'HomeName',
                //                         // controller.homeName == null
                //                         //     ? 'set_home_address'.tr
                //                         //     : controller.homeName,
                //                         maxLines: 1,
                //                         overflow: TextOverflow.ellipsis,
                //                         style: Get.textTheme.bodyText2
                //                             .copyWith(
                //                             fontSize: 12,
                //                             color: Colors.grey)),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     Card(
                //       margin: EdgeInsets.zero,
                //       child: InkWell(
                //         onTap: () {
                //           // if (controller.workLocation == null) {
                //           //   controller.addHomeAndWorkTask(LocationType.WORK);
                //           // } else {
                //           //   if (pickUpNode.hasFocus) {
                //           //     controller.setLocationToHolder(LocationType.WORK, LocationType.PICKUP);
                //           //   } else {
                //           //     controller.setLocationToHolder(LocationType.WORK, LocationType.DESTINATION);
                //           //   }
                //           //   controller.showOnMap();
                //           // }
                //           Get.back();
                //         },
                //         child: Container(
                //           padding: EdgeInsets.all(8),
                //           margin: EdgeInsets.all(8),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.all(4),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(30),
                //                   color: Colors.grey.withOpacity(0.4),
                //                 ),
                //                 child: Icon(
                //                   Icons.work_outline,
                //                   size: 20,
                //                 ),
                //               ),
                //               SizedBox(width: 8),
                //               Expanded(
                //                 child: Column(
                //                   crossAxisAlignment:
                //                   CrossAxisAlignment.start,
                //                   children: [
                //                     Text('work'.tr,
                //                         style: Get.textTheme.headline5
                //                             .copyWith(fontSize: 14)),
                //                     Text(
                //                         'Work Address',
                //                         // controller.workName == null
                //                         //     ? 'set_work_address'.tr
                //                         //     : controller.workName,
                //                         maxLines: 1,
                //                         overflow: TextOverflow.ellipsis,
                //                         style: Get.textTheme.bodyText2
                //                             .copyWith(
                //                             fontSize: 12,
                //                             color: Colors.grey)),
                //                   ],
                //                 ),
                //               ),s
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
                //     : Container(),

                Obx(
                  () => controller.predictionList.length > 0
                      ? SizedBox(height: 16)
                      : Container(),
                ),
                Obx(
                  () => controller.predictionList.length > 0
                      ? Expanded(
                          child: Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                var selectedPrediction =
                                    controller.predictionList[index];
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (pickUpNode.hasFocus) {
                                          print('current node is=== pickupnode');
                                          controller.updateLastLocationName(
                                              selectedPrediction.description);
                                          final status = await controller
                                              .fetchLatLngFromId(
                                                  selectedPrediction.placeId,
                                                  LocationType.PICKUP);
                                          if (!status) {
                                            CustomSnackbar.showCustomSnackBar(
                                                message:
                                                    controller.errorMessage);
                                          } else {
                                            controller.showOnMap();
                                            Get.back();
                                          }
                                        } else if (destinationNode.hasFocus) {
                                          print('current node is=== destination node');
                                          controller.updateLastLocationName(
                                              selectedPrediction.description);
                                          final status = await controller
                                              .fetchLatLngFromId(
                                                  selectedPrediction.placeId,
                                                  LocationType.DESTINATION);
                                          if (!status) {
                                            CustomSnackbar.showCustomSnackBar(
                                                message:
                                                    controller.errorMessage);
                                          } else {
                                            print('don t know which node is this===');
                                            controller.showOnMap();
                                            Get.back();
                                          }
                                        }
                                        controller.updatePredictionList([]);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_pin),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                controller.predictionList[index]
                                                    .description,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Get.textTheme.bodyText2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.4),
                                    )
                                  ],
                                );
                              },
                              itemCount: controller.predictionList.length,
                            ),
                          ),
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
