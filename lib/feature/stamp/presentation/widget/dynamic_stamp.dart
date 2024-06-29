import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constant_colors.dart';
import '../stamp_controller.dart';

class DynamicStamp extends StatelessWidget {
  const DynamicStamp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StampController>(
        id: "dynamic_stamp",
        builder: (controller) {
          return SizedBox(
            height: 256,
            width: 256,
            child: Stack(
              children: [
                Positioned.fill(
                  child: controller.stampAsset != null
                      ? SvgPicture.string(
                          controller.stampAsset!,
                          // width: 150,
                          // height: 150,
                          color: ConstantColors
                              .stampColors[controller.selectedColorIndex],
                        )
                      : const SizedBox.shrink(),
                ),
                if (controller.selectedCountryForDynamicStamp != null)
                  Align(
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                          offset: Offset(0, controller.isTriangle ? 80 : 50),
                          child: SizedBox(
                            width: controller.isTriangle ? 50 : double.infinity,
                            child: Text(
                              controller.selectedCountryForDynamicStamp!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                  Positioned.fill(
                    top: controller.isTriangle ? 30 : 0,
                    child: Center(
                      child: SizedBox(
                        width: controller.isTriangle ? 88 : 128,
                        height: controller.isTriangle ? 88 : 128,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            if (controller.stampAssetMain != null)
                              SvgPicture.string(
                                controller.stampAssetMain!,
                                // color: colors[selectedColorIndex],
                              ),
                            if (controller.travelModeAsset != null)
                              Positioned(
                                top: 28,
                                left: 50,
                                child: SvgPicture.string(
                                  controller.travelModeAsset!,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(0, 2.5),
                                child: Transform.rotate(
                                  angle: -(.1185079),
                                  child: Container(
                                    width: controller.isTriangle ? 128 : 128,
                                    height: controller.isTriangle ? 18 : 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ConstantColors.stampColors[
                                          controller.selectedColorIndex],
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.selectedWay ?? '',
                                        style: TextStyle(
                                          fontSize:
                                              controller.isTriangle ? 12 : 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.translate(
                    offset: const Offset(0, -40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.selectedDate != null)
                          Text(
                            controller.selectedDate!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        Text(
                          controller.cityName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
