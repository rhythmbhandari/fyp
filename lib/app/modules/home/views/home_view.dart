import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:quicki/app/enum/service_type.dart';
import 'package:quicki/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/carousal_view.dart';

import '../controllers/home_controller.dart';
import 'custom_icon_button.dart';

class HomeView extends GetView<HomeController> {
  DashboardController dashboardController = Get.find();

  HomeView({Key key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeff3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: Get.textTheme.headline6.copyWith(
                                color: Get.theme.primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: getResponsiveFont(14)),
                            children: [
                              WidgetSpan(
                                  child: Container(
                                    padding: const EdgeInsets.all(2.0),
                                  )),
                              const TextSpan(
                                  text: 'Welcome to,',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              const TextSpan(
                                  text: '\n' + 'Quicki',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff3f48cc),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24)),
                              WidgetSpan(
                                  child: Container(
                                    padding: const EdgeInsets.all(2.0),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomIconButton(
                            rightBorder: true,
                            bottomBorder: true,
                            topBorder: true,
                            iconUrl: 'assets/icons/taxi.png',
                            title: "Taxi",
                            onTap: () async {
                              Get.toNamed(Routes.BOOKING, arguments: ServiceType.car);
                              // CustomSnackbar.showCusotmSnackBar(message: 'Bike Tapped.');
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomIconButton(
                            rightBorder: true,
                            bottomBorder: true,
                            topBorder: true,
                            iconUrl: 'assets/icons/motorbike.png',
                            title: "Bike",
                            onTap: () async {
                              Get.toNamed(Routes.BOOKING, arguments: ServiceType.car);
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomIconButton(
                            bottomBorder: true,
                            topBorder: true,
                            iconUrl:  'assets/icons/parcel.png',
                            title: 'Parcel',
                            onTap: () async {
                              Get.toNamed(Routes.BOOKING, arguments: ServiceType.city_safari);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    color: Colors.white,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Promotions',
                          style: Get.textTheme.headline6,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    child: CarousalView(
                      imageUrlList: const [
                        'assets/images/ad1.png',
                        'assets/images/ad2.png',
                        'assets/images/ad3.png',
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 16,
                    color: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  Container(
                    width: Get.width,
                    height: 16,
                    color: Color(0xffeeeff3),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  Container(
                    width: Get.width,
                    color: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get discount.",
                          style: Get.textTheme.headline6,
                        ),
                        const SizedBox(height: 16),
                        Center(
                            child: SvgPicture.asset(
                              'assets/svg_assets/discount.svg',
                              height: Get.height * 0.3,
                              fit: BoxFit.contain,
                            )),
                        Text(
                          "Share this code",
                          style: Get.textTheme.bodyText2
                              .copyWith(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            'Share your code: TEST1234',
                                            textAlign: TextAlign.center,
                                            style: Get.textTheme.headline6
                                                .copyWith(fontSize: 14))),
                                    Container(
                                        height: 24,
                                        width: 1,
                                        color: Colors.black),
                                    SizedBox(width: 16),
                                    Icon(Icons.copy,
                                        color: Get.theme.primaryColor),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            ElevatedButton(
                              child: Text("Invite"),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Get.theme.primaryColor)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.1,
                    color: Colors.white,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomToolbarShape extends CustomPainter {
  final Color lineColor;

  const CustomToolbarShape({this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

//First oval
    Path path = Path();
    Rect pathGradientRect = new Rect.fromCircle(
      center: new Offset(size.width / 4, 0),
      radius: size.width / 1.4,
    );

    Gradient gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(225, 89, 89, 1).withOpacity(0.8),
        Color.fromRGBO(255, 89, 89, 1).withOpacity(1),
      ],
      stops: [
        0.3,
        1.0,
      ],
    );

    path.lineTo(-size.width / 1.4, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height * 2, size.width + size.width / 1.4, 0);

    paint.color = Colors.deepOrange;
    paint.shader = gradient.createShader(pathGradientRect);
    paint.strokeWidth = 40;
    path.close();

    canvas.drawPath(path, paint);

//Second oval
    Rect secondOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 1.5),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(225, 89, 89, 1).withOpacity(0.4),
        Color.fromRGBO(255, 89, 89, 1).withOpacity(0.7),
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint secondOvalPaint = Paint()
      ..color = Colors.deepOrange
      ..shader = gradient.createShader(secondOvalRect);

    canvas.drawOval(secondOvalRect, secondOvalPaint);

//Third oval
    Rect thirdOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 2.7),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(225, 255, 255, 1).withOpacity(0.05),
        Color.fromRGBO(255, 89, 89, 1).withOpacity(0.4),
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint thirdOvalPaint = Paint()
      ..color = Colors.red
      ..shader = gradient.createShader(thirdOvalRect);

    canvas.drawOval(thirdOvalRect, thirdOvalPaint);

//Fourth oval
    Rect fourthOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.4, -size.width / 1.875),
      Offset(size.width / 1.34, size.height / 1.14),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Colors.red.withOpacity(0.2),
        Color.fromRGBO(225, 89, 89, 1).withOpacity(0.7),
      ],
      stops: [
        0.3,
        1.0,
      ],
    );
    Paint fourthOvalPaint = Paint()
      ..color = Colors.red
      ..shader = gradient.createShader(fourthOvalRect);

    canvas.drawOval(fourthOvalRect, fourthOvalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
