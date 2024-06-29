import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionWidget extends StatelessWidget {
  DateSelectionWidget({super.key, required this.getDate});
  void Function(String?) getDate;

  TextEditingController dateTimeTextController = TextEditingController();

  Future<String?> pickDate(BuildContext context) async {
    String? selectedDateString;
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
    );
    if (selectedDate != null) {
      selectedDateString = DateFormat('d MMM yyyy').format(selectedDate);
      dateTimeTextController.text = selectedDateString;
    }
    return selectedDateString;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String? pickedDateString = await pickDate(context);
        getDate(pickedDateString);
      },
      child: TextField(
        controller: dateTimeTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Colors.orange),
          ),
          suffixIcon: const Icon(Icons.calendar_today_outlined),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Colors.orange),
          ),
          fillColor: Colors.blue.withOpacity(0.1),
          hintText: 'Select Date',
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.black),
        enabled: false,
      ),
    );
  }
}
