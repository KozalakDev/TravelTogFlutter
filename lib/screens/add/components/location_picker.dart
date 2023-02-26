import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    super.key,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      
      flagState: CountryFlag.DISABLE,
      onCountryChanged: (value) {
        setState(() {
          countryValue = value;
        });
      },
      onStateChanged: (value) {
        setState(() {
          stateValue = value ?? "";
        });
      },
      onCityChanged: (value) {
        setState(() {
          cityValue = value ?? "";
        });
      },
    );
  }
}
