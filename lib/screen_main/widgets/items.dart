import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test/screen_main/widgets/widgets.dart';


List<String> filterSelections = [
    'Pastry',
    'Pie Fillings',
    'Pie Mixes',
    'Dark Chocolate',
    'Milk White Chocolate',
    'Other Pastry',
    'Frozen Pastry',
  ];

  List<String> dairyProducts = ["Dairy", "Coffee &amp"];
  List<String> fruitsProducts = [
    "Dry/Nuts See",
    "Canned & Bot",
    "Canned & amp",
    "Frozen Fruits",
    "Frozen Fruits"
  ];
 
  void clearFilters({
  required ValueSetter<bool> setDairy,
  required ValueSetter<bool> setCategory,
  required ValueSetter<bool> setFruits,
  required List<String> selectedItems,
  required List<String> selectedDairy,
  required List<String> selectedFruits,
}) {
  setDairy(false);
  setCategory(false);
  setFruits(false);
  selectedItems.clear();
  selectedDairy.clear();
  selectedFruits.clear();
}


void applyFilters({ // Remove the underscore to make it public
  required List<String> selectedItems,
  required List<String> selectedDairy,
  required List<String> selectedFruits,
}) {
  log('Categories Selected');
  for (var item in selectedItems) {
    log(item);
  }
  log('=====================');

  log('Dairy Selected');
  for (var item in selectedDairy) {
    log(item);
  }
  log('=====================');

  log('Fruits, Vegetables & Nuts');
  for (var item in selectedFruits) {
    log(item);
  }
}


Widget buildBottomBar({
  required Size size,
  required Function() onClearFilters,
  required Function() onApplyFilters,
}) {
  return Container(
    width: size.width,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onClearFilters,
            child: const Text(
              'Clear Filter',
              style: TextStyle(
                fontSize: 15,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ReusableButton(
            text: 'Apply',
            onPressed: onApplyFilters,
            color: Colors.blue,
            textColor: Colors.white,
            minWidth: 130,
            height: 40,
            fontSize: 15,
          ),
        ],
      ),
    ),
  );
}
