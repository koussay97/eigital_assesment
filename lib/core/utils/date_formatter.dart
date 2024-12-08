import 'package:flutter/material.dart';

String formatDate({required DateTime? date}) {
  String formatted =
      '${date?.day ?? '--'} ${date?.month ?? '--'} ${date?.year ?? '--'}';
  return formatted;
}
