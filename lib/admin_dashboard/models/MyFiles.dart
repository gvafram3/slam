// import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CategoryCardInfo {
  final String? title;
  final Icon? icon;
  final int? totalNumber;
  final Color? color;

  CategoryCardInfo({
    this.icon,
    this.title,
    // this.totalStorage,
    this.totalNumber,
    // this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CategoryCardInfo(
    title: "Reports",
    totalNumber: 128,
    icon: Icon(
      Icons.message_outlined,
      color: primaryColor,
    ),
    // totalStorage: "1.9GB",
    color: primaryColor.withOpacity(0.1),
    // percentage: 35,
  ),
  CategoryCardInfo(
    title: "Track Student",
    totalNumber: 14,
    icon: Icon(
      Icons.location_on_outlined,
      color: Color(0xFFFFA113),
    ),
    // totalStorage: "2.9GB",
    color: Color(0xFFFFA113).withOpacity(0.1),
    // percentage: 35,
  ),
  CategoryCardInfo(
    title: "SOS Alert",
    totalNumber: 145,
    icon: Icon(
      Icons.ac_unit,
      color: Color(0xFFA4CDFF),
    ),
    // totalStorage: "1GB",
    color: Color(0xFFA4CDFF).withOpacity(0.1),
    // percentage: 10,
  ),
];
