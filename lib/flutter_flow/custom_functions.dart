import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';


String? convertDateToText(String? inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate!);
  String formattedDate = DateFormat(" MMMM d, yyyy ").format(parsedDate);
  return formattedDate;
}

String? translateDate(
    String date,
    String language,
    ) {
  DateFormat formatter = DateFormat.yMMMMd(language);
  String translatedDate = formatter.format(DateTime.parse(date));
  return translatedDate;
}