
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constant_colors.dart';
import '../stamp_controller.dart';
import 'stamp_painter.dart';

class BasicStamp extends StatelessWidget {
  const BasicStamp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StampController>(
      id: 'basic_stamp',
      builder: (controller) {
        return SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset(
                'assets/passport/base_stamp/basic_stamp.svg',
                width: 150,
                height: 150,
                color: ConstantColors
                    .stampColors[controller.selectedColorIndex],
              ),
              if (controller.travelModeAsset != null)
                Positioned(
                  top: 48,
                  left: 100 - 36,
                  child: SvgPicture.string(
                    controller.travelModeAsset!,
                    height: 48,
                    width: 48,
                    fit: BoxFit.fill,
                  ),
                ),
              Center(
                child: Transform.translate(
                  offset: const Offset(0, 10),
                  child: Transform.rotate(
                    angle: -pi / 9,
                    child: Text(
                      controller.selectedWay ?? '',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              CustomPaint(
                painter: StampPainter(
                  country: controller.selectedCountry ?? '',
                  city: controller.cityName.length > 14
                      ? ''
                      : controller.cityName,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
