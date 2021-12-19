import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/modules/trip/controllers/trip_controller.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_button.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';

class CancelDialog extends StatelessWidget {
  TripController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: Container(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'CANCEL BOOKING',
              style: Get.textTheme.bodyText2.copyWith(
                color: Colors.red,
                fontSize: getResponsiveFont(20),
              ),
            ),
            SizedBox(height: 16),
            SvgPicture.asset(
              'assets/svg_images/warning.svg',
              height: Get.height * 0.2,
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure, you want to cancel this booking?',
              style: Get.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'We are searching for riders around your location.',
              style: Get.textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                      ),
                      child: CustomButton(
                        onPressed: () async{
                          Navigator.of(context).pop();
                          const response = true;
                          if (response){
                            CustomSnackbar.showCustomSnackBar(message: 'Booking Cancelled');
                            Get.offAllNamed(Routes.DASHBOARD);
                          }
                        },
                        text: 'Yes',
                        backgroundColor: Colors.red,
                      ),
                    )),
                VerticalDivider(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'No',
                      backgroundColor: Colors.green,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}