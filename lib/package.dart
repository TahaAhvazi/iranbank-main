import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum BankType {
  meli,
  type2,
  type3,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.rearText,
    required this.frontText,
    required this.cartNumber,
    required this.height,
    required this.width,
    required this.banktype,
    this.heighBackImage = 150,
    this.widthBackImage = 300,
  }) : super(key: key);
  final Widget rearText;
  final Widget frontText;
  final String title;
  final int cartNumber;
  final double height, width;
  final double heighBackImage;
  final double widthBackImage;
  final BankType banktype;
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _showFrontSide;
  late bool _flipXAxis;
  int count = 0;

  String setIMageAdress() {
    String imagePath = ''; // Initialize imagePath

    // Determine the image path based on the bankType
    switch (widget.banktype) {
      case BankType.meli:
        imagePath = 'assets/melilogo.png';
        return imagePath;
      case BankType.type2:
        imagePath = 'assets/image_type2.png';
        return imagePath;
      case BankType.type3:
        imagePath = 'assets/image_type3.png';
        return imagePath;
    }
  }

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return buildFlipAnimation();
  }

  void _changeRotationAxis(bool isX) {
    setState(() {
      isX ? _flipXAxis = true : _flipXAxis = false;
    });
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget buildFlipAnimation() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          setState(() {
            if (kDebugMode) {
              print("RIGHT ROTATION");
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 600))
                  .then((value) => count = 0);
            }
          });
        }
        if (details.delta.dx < 0) {
          setState(() {
            if (kDebugMode) {
              print("LEFT ROTATION");
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(true);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
        }
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          setState(() {
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
          if (kDebugMode) {
            print("DOWN ROTATION");
          }
        }
        if (details.delta.dy < 0) {
          setState(() {
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count == 0) {
              _changeRotationAxis(false);
              _switchCard();
              count++;
            }
            if (count != 0) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((value) => count = 0);
            }
          });
          if (kDebugMode) {
            print("UP ROTATION");
          }
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 1, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 2, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      cartNumber: widget.cartNumber,
      height: widget.height,
      width: widget.width,
      faceName: "Front",
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                "assets/back.png",
                height: widget.heighBackImage,
                width: widget.heighBackImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/shetab.png",
                      height: 50,
                      width: 50,
                    ),
                    Image.asset(
                      setIMageAdress(),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "IR23453498753946593465",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.cartNumber.toString()),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1405/06"),
                            Text("طاها  اهوازی"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CVV2:6118"),
                            Text("12345678909876"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
        key: const ValueKey(false),
        width: widget.width,
        height: widget.height,
        cartNumber: widget.cartNumber,
        backgroundColor: Colors.blue.shade700,
        faceName: "Rear",
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              width: 280,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "استفاده از این کارت صرفا مخصوص دارنده کارت میباشد",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "در صورتی که صاحب کارت بانکی نیستید با بانک در میان بگذارید",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required double height,
      required double width,
      int? cartNumber,
      required Color backgroundColor}) {
    return Container(
      key: key,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
