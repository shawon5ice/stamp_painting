import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:passport_stamp/core/constants/constant_colors.dart';
import 'package:passport_stamp/core/constants/constant_strings.dart';
import 'package:passport_stamp/core/constants/constant_svg.dart';
import 'package:passport_stamp/feature/stamp/data/models/stamp_background.dart';
import 'package:passport_stamp/feature/stamp/data/models/travel_mode.dart';

class StampController extends GetxController {
  late List<StampBackgroundModel> stampBackgrounds = [];
  late List<TravelMode> travelModes = [];
  String? imageData;

  StampBackgroundModel? selectedStampBackground;
  TravelMode? selectedTravelMode;
  String? selectedCountry;
  String? selectedWay;
  String? selectedDate;
  String cityName = '';
  int selectedColorIndex = 0;
  late Color selectedColor;

  String? selectedCountryForDynamicStamp;
  String? travelModeAsset;
  String? stampAsset;
  String? stampAssetMain;

  bool isTriangle = false;
  bool isTransparent = false;

  @override
  void onInit() {
    populateAssets();
    selectedColor = Colors.black;
    selectedWay = ConstantStrings.way.first;
    loadTravelModeAsset();
    super.onInit();
  }

  Future populateAssets() async {
    for (int i = 0; i < ConstantStrings.stampBackgroundNames.length; i++) {
      stampBackgrounds.add(StampBackgroundModel(
          id: i%11,
          label: ConstantStrings.stampBackgroundNames[i],
          assetLink: ConstantSvg.stampBackgrounds[i]));
    }

    for (int i = 0; i < ConstantStrings.travelModes.length; i++) {
      travelModes.add(TravelMode(
          label: ConstantStrings.travelModes[i],
          assetLink: ConstantSvg.travelModes[i]));
    }
    selectedStampBackground = stampBackgrounds.first;
  }

  Future<void> loadTravelModeAsset() async {
    if (selectedTravelMode != null) {
      travelModeAsset =
          await rootBundle.loadString(selectedTravelMode!.assetLink).then(
                (value) => value.replaceAll(RegExp(r'black'),
                    "#${ConstantColors.stampColors[selectedColorIndex].value.toRadixString(16).substring(2)}"),
              );
    }

    if (selectedStampBackground != null) {
      stampAsset =
          await rootBundle.loadString(selectedStampBackground!.assetLink).then(
                (value) => value.replaceAll(RegExp(r'#ffffff'),
                    "#${ConstantColors.stampColors[selectedColorIndex].value.toRadixString(16).substring(2)}"),
              );
    }

    stampAssetMain = await rootBundle
        .loadString('assets/passport/base_stamp/${isTransparent?"fixed_stamp_transparent":"fixed_stamp"}.svg')
        .then(
          (value) => isTransparent? value.replaceAll(RegExp(r'white'), "#${ConstantColors.stampColors[selectedColorIndex].value.toRadixString(16).substring(2)}"):value.replaceAll(RegExp(r'#black'), "#ffffff"),
        );
    update(["basic_stamp", "dynamic_stamp"]);
  }


  Future<void> convertWidgetToImage(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        String base64String = base64Encode(pngBytes);
        print(base64String);
        imageData = base64String;
        update(['converted_image']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
