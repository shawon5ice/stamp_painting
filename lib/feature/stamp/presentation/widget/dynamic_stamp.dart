import 'package:auto_size_text/auto_size_text.dart';
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
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<StampController>(
        id: "dynamic_stamp",
        builder: (controller) {
          switch (controller.selectedStampBackground?.id) {
            case 0:
            case 1:
            case 2:
            case 6:
            case 7:
            case 8:
            case 9:
              return SizedBox(
                height: width * .4,
                width: width * .4,
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
                              fit: BoxFit.contain,
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (controller.selectedCountryForDynamicStamp != null)
                      Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                              offset:
                                  Offset(0, width *.08),
                              child: SizedBox(
                                width: controller.isTriangle
                                    ? 50
                                    : double.infinity,
                                child: AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 9,
                                  controller.selectedCountryForDynamicStamp!,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600),
                                ),
                              ))),
                    Positioned.fill(
                      top: controller.isTriangle ? 30 : 0,
                      child: Center(
                        child: SizedBox(
                          width: controller.isTriangle ? 88 : width * .2,
                          height: controller.isTriangle ? 88 : width * .2,
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
                                  top: 10,
                                  left: 25,
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
                                      width: 128,
                                      height: 24,
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
                                                controller.isTriangle ? 10 : 12,
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
                        offset: Offset(0, - (width *.07)),
                        child: SizedBox(
                          width: width * .2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.selectedDate != null)
                                AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 7,
                                  controller.selectedDate!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 7,
                                controller.cityName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case 3:
              return SizedBox(
                height: width * .4,
                width:  width * .35,
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
                        fit: BoxFit.fill,
                      )
                          : const SizedBox.shrink(),
                    ),
                    if (controller.selectedCountryForDynamicStamp != null)
                      Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                              offset: Offset(0, width*.06),
                              child: AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 9,
                                controller.selectedCountryForDynamicStamp!,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600),
                              ))),
                    Positioned.fill(
                      top:  0,
                      child: Center(
                        child: SizedBox(
                          width:  width * .2,
                          height: width * .2,
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
                                  top: 10,
                                  left: 25,
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
                                            controller.isTriangle ? 10 : 12,
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
                        offset: Offset(0, - width *.06),
                        child: SizedBox(
                          width: width * .2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.selectedDate != null)
                                AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 7,
                                  controller.selectedDate!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 7,
                                controller.cityName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case 4:
              return SizedBox(
                height: width * .4,
                width: width * .45,
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
                        fit: BoxFit.contain,
                      )
                          : const SizedBox.shrink(),
                    ),
                    if (controller.selectedCountryForDynamicStamp != null)
                      Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                              offset:
                              Offset(0, width *.07),
                              child: SizedBox(
                                width: controller.isTriangle
                                    ? 50
                                    : double.infinity,
                                child: AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 9,
                                  controller.selectedCountryForDynamicStamp!,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600),
                                ),
                              ))),
                    Positioned.fill(
                      top: controller.isTriangle ? 30 : 0,
                      child: Center(
                        child: SizedBox(
                          width: controller.isTriangle ? 88 : width * .2,
                          height: controller.isTriangle ? 88 : width * .2,
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
                                  top: 10,
                                  left: 25,
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
                                      width: 128,
                                      height: 24,
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
                                            controller.isTriangle ? 10 : 12,
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
                        offset: Offset(0, - (width *.06)),
                        child: SizedBox(
                          width: width * .2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.selectedDate != null)
                                AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 7,
                                  controller.selectedDate!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 7,
                                controller.cityName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case 10:
              return SizedBox(
                height: width * .6,
                width: width * .45,
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
                        fit: BoxFit.contain,
                      )
                          : const SizedBox.shrink(),
                    ),
                    if (controller.selectedCountryForDynamicStamp != null)
                      Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                              offset:
                              Offset(0, width *.22),
                              child: SizedBox(
                                width: 25,
                                child: AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 9,
                                  controller.selectedCountryForDynamicStamp!,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600),
                                ),
                              ))),
                    Positioned.fill(
                      top: 30,
                      child: Center(
                        child: SizedBox(
                          width:  width * .15,
                          height: width * .15,
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
                                  top: 10,
                                  left: 25,
                                  child: SvgPicture.string(
                                    controller.travelModeAsset!,
                                    height: 16,
                                    width: 16,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              Center(
                                child: Transform.translate(
                                  offset: const Offset(0, 2.5),
                                  child: Transform.rotate(
                                    angle: -(.1185079),
                                    child: Container(
                                      width: 128,
                                      height: 16,
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
                                            controller.isTriangle ? 10 : 12,
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
                        offset: Offset(0, - (width *.06)),
                        child: SizedBox(
                          width: width * .2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.selectedDate != null)
                                AutoSizeText(
                                  minFontSize: 6,
                                  maxFontSize: 7,
                                  controller.selectedDate!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 7,
                                controller.cityName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );

          }

          if (controller.selectedStampBackground?.id == 4) {
            return SizedBox(
              height: width * .35,
              width: width * .35,
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
                            fit: BoxFit.contain,
                          )
                        : const SizedBox.shrink(),
                  ),
                  if (controller.selectedCountryForDynamicStamp != null)
                    Align(
                        alignment: Alignment.topCenter,
                        child: Transform.translate(
                            offset: Offset(0, controller.isTriangle ? 80 : 20),
                            child: SizedBox(
                              width:
                                  controller.isTriangle ? 50 : double.infinity,
                              child: AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 9,
                                controller.selectedCountryForDynamicStamp!,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))),
                  Positioned.fill(
                    top: controller.isTriangle ? 30 : 0,
                    child: Center(
                      child: SizedBox(
                        width: controller.isTriangle ? 88 : width * .2,
                        height: controller.isTriangle ? 88 : width * .2,
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
                                top: 10,
                                left: 25,
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
                                              controller.isTriangle ? 10 : 12,
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
                      offset: const Offset(0, -10),
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (controller.selectedDate != null)
                              AutoSizeText(
                                minFontSize: 6,
                                maxFontSize: 7,
                                controller.selectedDate!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            AutoSizeText(
                              minFontSize: 6,
                              maxFontSize: 7,
                              controller.cityName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox(
            height: width * .35,
            width: width * .35,
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
                          fit: BoxFit.contain,
                        )
                      : const SizedBox.shrink(),
                ),
                if (controller.selectedCountryForDynamicStamp != null)
                  Align(
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                          offset: Offset(0, controller.isTriangle ? 80 : 20),
                          child: SizedBox(
                            width: controller.isTriangle ? 50 : double.infinity,
                            child: AutoSizeText(
                              minFontSize: 6,
                              maxFontSize: 9,
                              controller.selectedCountryForDynamicStamp!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600),
                            ),
                          ))),
                Positioned.fill(
                  top: controller.isTriangle ? 30 : 0,
                  child: Center(
                    child: SizedBox(
                      width: controller.isTriangle ? 88 : width * .2,
                      height: controller.isTriangle ? 88 : width * .2,
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
                              top: 10,
                              left: 25,
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
                                            controller.isTriangle ? 10 : 12,
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
                    offset: const Offset(0, -10),
                    child: SizedBox(
                      width: width * .2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (controller.selectedDate != null)
                            AutoSizeText(
                              minFontSize: 6,
                              maxFontSize: 7,
                              controller.selectedDate!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          AutoSizeText(
                            minFontSize: 6,
                            maxFontSize: 7,
                            controller.cityName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
