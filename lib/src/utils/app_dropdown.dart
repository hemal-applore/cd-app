import 'package:cd_app/src/utils/text_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppDropdown extends StatefulWidget {
  const AppDropdown({
    super.key,
    this.selectedValue,
    required this.items,
    this.onChanged,
  });
  final DropDownData? selectedValue;
  final List<DropDownData> items;
  final void Function(DropDownData?)? onChanged;

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      customButton: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorConstants.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.selectedValue?.title ?? 'Filter',
              style: TextUtils.poppins(
                const TextStyle(
                  color: ColorConstants.primaryTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.arrow_drop_down,
              color: ColorConstants.primaryTextColor,
              size: 20,
            ),
          ],
        ),
      ),
      value: widget.selectedValue?.value,
      style: TextUtils.poppins(
        const TextStyle(
          color: ColorConstants.primaryTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      underline: const SizedBox(),
      items: widget.items.map((DropDownData value) {
        return DropdownMenuItem<String>(
          value: value.value,
          child: Text(value.title),
        );
      }).toList(),
      onChanged: (String? value) {
        final selectedValue = widget.items.firstWhere(
          (element) => element.value == value,
        );
        widget.onChanged?.call(selectedValue);
      },
    );
  }
}

class DropDownData {
  final String id;
  final String title;
  final String value;

  DropDownData({
    required this.id,
    required this.title,
    required this.value,
  });
}
