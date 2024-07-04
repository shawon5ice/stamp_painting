import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constant_colors.dart';
import '../stamp_controller.dart';
import 'country_name_widget.dart';
import 'date_and_city_name_widget.dart';
import 'stamp_background_asset.dart';

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
        int id = controller.selectedStampBackground?.id ?? 0;
        double bgWidth = width * .4;
        double bgHeight = width * .4;
        Offset countryTextYOffset = Offset(0, 0);
        Offset dateCityTextYOffset = Offset(0, 0);
        double stampAssetWidth = width * .2;
        double stampAssetHeight = width * .2;
        double stampAssetTop = 0;
        double wayTextWidth = width * .2;
        double wayTextHeight = width * .05;
        double travelModeAssetTop = 25;
        double travelModeAssetLeft = 10;
        double travelModeAssetWidth = 24;
        double travelModeAssetHeight = 24;

        if (id <= 2 || (id >= 5 && id <= 9)) {
          countryTextYOffset = Offset(0, width * .08);
          travelModeAssetLeft = 25;
          travelModeAssetTop = 10;
          dateCityTextYOffset = Offset(0, -(width * .07));
        } else if (id == 3) {
          bgHeight = width * .4;
          bgWidth = width * .35;
          countryTextYOffset = Offset(0, width * .07);
          travelModeAssetLeft = 25;
          travelModeAssetTop = 10;
          dateCityTextYOffset = Offset(0, -(width * .06));
        } else if (id == 4) {
          bgHeight = width * .4;
          bgWidth = width * .45;
          travelModeAssetLeft = width * .07;
          travelModeAssetTop = width * .02;
          countryTextYOffset = Offset(0, width * .07);
          dateCityTextYOffset = Offset(0, -(width * .065));
        } else if (id == 5) {
          dateCityTextYOffset = Offset(0, -(width * .04));
        } else if (id == 10) {
          bgHeight = width * .6;
          bgWidth = width * .45;
          countryTextYOffset = Offset(0, width * .22);
          dateCityTextYOffset = Offset(0, -(width * .14));
          stampAssetHeight = width * .14;
          stampAssetWidth = width * .14;
          stampAssetTop = width * .11;
          wayTextHeight = 16;
          wayTextWidth = 128;
          travelModeAssetLeft = 25;
          travelModeAssetTop = 10;
          travelModeAssetHeight = 16;
          travelModeAssetWidth = 16;
        }
        return SizedBox(
          height: bgHeight,
          width: bgWidth,
          child: Stack(
            children: [
              StampBackgroundAsset(),
              if (controller.selectedCountryForDynamicStamp != null)
                controller.isTriangle
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: Transform.translate(
                            offset: Offset(0, width * .22),
                            child: SizedBox(
                              width: width * .10 > 64? width * .10 : 56,
                              height: width * .1,
                              child: Center(
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
                              ),
                            )))
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Transform.translate(
                            offset: countryTextYOffset,
                            child: CountryNameWidget())),
              Positioned.fill(
                top: stampAssetTop,
                child: Center(
                  child: SizedBox(
                    width: stampAssetWidth,
                    height: stampAssetHeight,
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
                            top: travelModeAssetTop,
                            left: travelModeAssetLeft,
                            child: SvgPicture.string(
                              controller.travelModeAsset!,
                              height: travelModeAssetHeight,
                              width: travelModeAssetWidth,
                              fit: BoxFit.fill,
                            ),
                          ),
                        Center(
                          child: Transform.translate(
                            offset: const Offset(0, 2.5),
                            child: Transform.rotate(
                              angle: -(.1185079),
                              child: Container(
                                width: wayTextWidth,
                                height: wayTextHeight,
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
                                      fontSize: controller.isTriangle ? 10 : 12,
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
                  offset: dateCityTextYOffset,
                  child: DateAndCityNameWidget(width: width),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
