
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_strings.dart';
import '../../../../core/helpers/size_box_extension.dart';
import '../stamp_controller.dart';

class WaySelectionWidget extends StatelessWidget {
  const WaySelectionWidget({
    super.key,
    required this.controller,
  });

  final StampController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio<String>(
              value: ConstantStrings.way.first,
              groupValue: controller.selectedWay,
              onChanged: (value) {
                controller.selectedWay = value;
                controller.update(['way_selection','basic_stamp','dynamic_stamp']);
              },
            ),
            Text(ConstantStrings.way.first)
          ],
        ),
        addWidth(32),
        Row(
          children: [
            Radio<String>(
              value: ConstantStrings.way.last,
              groupValue: controller.selectedWay,
              onChanged: (value) {
                controller.selectedWay = value;
                controller.update(['way_selection','basic_stamp','dynamic_stamp']);
              },
            ),
            Text(ConstantStrings.way.last)
          ],
        ),
      ],
    );
  }
}
