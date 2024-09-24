import 'package:flutter/material.dart';

class TeethModel {
  final String id;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final String? char;
  final int? stroke;

  TeethModel({
    required this.id,
    this.unSelectedColor,
    this.char,
    this.selectedColor,
    this.stroke,
  });

  TeethModel copyWith(final String? id, final Color? selectedColor,
          final Color? unSelectedColor, final int? stroke) =>
      TeethModel(
        selectedColor: selectedColor ?? this.selectedColor,
        stroke: stroke ?? this.stroke,
        id: id ?? this.id,
        unSelectedColor: unSelectedColor ?? this.unSelectedColor,
      );
}
