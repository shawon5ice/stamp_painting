import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:passport_stamp/core/constants/constant_colors.dart';
import 'package:passport_stamp/core/constants/constant_strings.dart';
import 'package:passport_stamp/core/constants/constant_svg.dart';
import 'package:passport_stamp/feature/stamp/data/models/stamp_background.dart';
import 'package:passport_stamp/feature/stamp/data/models/travel_mode.dart';

class StampController extends GetxController{

  late List<StampBackgroundModel> stampBackgrounds = [];
  late List<TravelMode> travelModes = [];

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

  @override
  void onInit() {
    populateAssets();
    selectedWay = ConstantStrings.way.first;
    loadTravelModeAsset();
    super.onInit();
  }


  Future populateAssets() async {
    for(int i=0; i<ConstantStrings.stampBackgroundNames.length; i++){
      stampBackgrounds.add(StampBackgroundModel(label: ConstantStrings.stampBackgroundNames[i], assetLink: ConstantSvg.stampBackgrounds[i]));
    }

    for(int i=0; i<ConstantStrings.travelModes.length; i++){
      travelModes.add(TravelMode(label: ConstantStrings.travelModes[i], assetLink: ConstantSvg.travelModes[i]));
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

    if(selectedStampBackground != null){
      stampAsset = await rootBundle.loadString(selectedStampBackground!.assetLink).then(
            (value) => value.replaceAll(RegExp(r'#ffffff'),
            "#${ConstantColors.stampColors[selectedColorIndex].value.toRadixString(16).substring(2)}"),
      );
    }


    stampAssetMain = await rootBundle.loadString('assets/passport/base_stamp/fixed_stamp.svg').then(
          (value) => value.replaceAll(RegExp(r'#black'), "#ffffff"),
    );
    update(["basic_stamp","dynamic_stamp"]);
  }
}