import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passport_stamp/core/constants/constant_strings.dart';
import 'package:passport_stamp/core/helpers/size_box_extension.dart';
import 'package:passport_stamp/feature/stamp/presentation/stamp_controller.dart';
import 'package:passport_stamp/feature/stamp/presentation/widget/custom_text_field.dart';
import 'package:passport_stamp/feature/stamp/presentation/widget/date_selection_widget.dart';

import 'widget/basic_stamp.dart';
import 'widget/color_selector_widget.dart';
import 'widget/custom_dropdown_widget.dart';
import 'widget/dropdown_menu_item.dart';
import 'widget/dynamic_stamp.dart';
import 'widget/way_selection_widget.dart';

class StampScreen extends StatelessWidget {
  StampScreen({super.key});

  final StampController controller = Get.put(StampController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Stamp Painting'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //Dynamic Stamp Background selection Dropdown Widget
                CustomDropDownWidget(
                  onChange: (background) {
                    controller.selectedStampBackground = background;
                    if (background != null &&
                        background.label.toLowerCase() == 'triangle') {
                      controller.isTriangle = true;
                    } else {
                      controller.isTriangle = false;
                    }
                    controller.loadTravelModeAsset();
                  },
                  items: controller.stampBackgrounds
                      .map(
                        (item) => dropdownMenuItemWithSvg(item),
                      )
                      .toList(),
                  hint: "Select Stamp Background",
                  label: "Stamp Background",
                ),
                addHeight(20),
                //Travel Mode selection Dropdown Widget
                CustomDropDownWidget(
                  onChange: (value) {
                    controller.selectedTravelMode = value;
                    controller.loadTravelModeAsset();
                    controller.update(["dynamic_stamp"]);
                  },
                  items: controller.travelModes
                      .map(
                        (item) => dropdownMenuItemWithSvg(item),
                      )
                      .toList(),
                  hint: "Select Travel Mode",
                  label: "Travel Mode",
                ),
                addHeight(20),
                //Country selection Dropdown Widget
                CustomDropDownWidget(
                  onChange: (country) {
                    controller.selectedCountryForDynamicStamp = country;
                    controller.selectedCountry = country;
                    controller.loadTravelModeAsset();
                    controller.update(["dynamic_stamp"]);
                  },
                  items: ConstantStrings.countries
                      .map(
                        (item) => dropdownMenuItem(item),
                      )
                      .toList(),
                  hint: "Select Traveling Country",
                  label: "Country",
                ),
                addHeight(20),
                //City Input field
                CustomTextField(
                  hint: "Enter City Name",
                  label: "City Name",
                  onChanged: (value) {
                    controller.cityName = value;
                    controller.loadTravelModeAsset();
                  },
                ),
                addHeight(20),
                //Way selection radio buttons
                GetBuilder<StampController>(
                  id: 'way_selection',
                  builder: (controller) {
                    return WaySelectionWidget(controller: controller);
                  },
                ),
                addHeight(20),
                //Stamp color selection widget
                ColorSelectorWidget(controller: controller),
                addHeight(20),
                //Dynamic Stamp date selection widget
                DateSelectionWidget(
                  getDate: (date) {
                    controller.selectedDate = date;
                    print("Date: ${controller.selectedDate}");
                    controller.update(["basic_stamp", "dynamic_stamp"]);
                  },
                ),


                addHeight(100),
                const BasicStamp(),
                addHeight(100),
                Row(
                  children: [
                    const DynamicStamp(),
                    Spacer(),
                    const DynamicStamp(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
