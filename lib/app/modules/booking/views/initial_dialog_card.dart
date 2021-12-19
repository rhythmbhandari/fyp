import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_and_work_location_tile.dart';
import 'location_icon_tile.dart';
import 'location_input_text_field.dart';

// class InitialDialogCard extends StatelessWidget {
//   final Function onTap;

//   InitialDialogCard({this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 6,
//         margin: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 8),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               LocationIconTile(
//                 title: LocaleKeys.text_current_location.tr,
//                 icon: Icons.my_location,
//                 iconColor: Get.theme.accentColor,
//                 textColor: Get.theme.accentColor,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
//                 child: Divider(
//                   color: Colors.grey,
//                 ),
//               ),
//               LocationIconTile(
//                 title: LocaleKeys.text_enter_destination.tr,
//                 iconColor: Get.theme.primaryColor,
//                 icon: Icons.location_pin,
//                 textColor: Colors.grey,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class InitialDialogCard extends StatelessWidget {
  final Function onTap;
  final Function onDrag;

  InitialDialogCard({this.onTap, this.onDrag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap,
            child: Hero(
              tag: 'destinationInput',
              child: Container(
                  margin: EdgeInsets.all(16),
                  child: LocationInputTextField(
                    enabled: false,
                    autofocus: false,
                    hint: "Search Destination",
                    icon: Icons.location_pin,
                  )),
            ),
          ),
          Hero(
            tag: 'homeAndWork',
            child: Container(child: HomeAndWorkLocationTile()),
          )
        ],
      ),
    );
  }
}

// class InitialDialogCard extends StatelessWidget {
//   final Function onTap;

//   InitialDialogCard({this.onTap});

//   final PanelController _pc = new PanelController();

//   @override
//   Widget build(BuildContext context) {
//     return SlidingUpPanel(
//       controller: _pc,
//       renderPanelSheet: false,
//       panel: _floatingPanel(),
//       collapsed: _floatingCollapsed(),
//       body: Center(
//         child: Text("This is the Widget behind the sliding panel"),
//       ),
//     );
//   }

//   Widget _floatingCollapsed(){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
//     ),
//     child: Row(children: [
//       Icon(Icons.location_pin),
//       TextField(
//       style: Get.textTheme.bodyText2,
//     ),
//     ],),
//   );
// }

// Widget _floatingPanel(){
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.all(Radius.circular(24.0)),
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 20.0,
//           color: Colors.transparent,
//         ),
//       ]
//     ),
//     child: Center(
//       child: Text("This is the SlidingUpPanel when open"),
//     ),
//   );
// }
// }
