import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/resources/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String? value) onChangeValue;
  final String selected;
  final List<String> options;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final Key? dropdownKey;

  const CustomDropDown({
    Key? key,
    required this.options,
    required this.selected,
    required this.onChangeValue,
    this.iconData,
    this.validator,
    this.dropdownKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 55,
      child: Row(
        children: <Widget>[
          if(iconData != null)
            Icon(iconData, size: 18, color: AppColors.grey),
          if(iconData != null)
            const SizedBox(width: 16,),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selected,
              key: dropdownKey,
              hint: Text(
                options.first,
              ),
              onChanged: onChangeValue,
              validator: validator,
              items:
              options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
