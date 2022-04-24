import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

LatLng getUsersLocation(LatLng userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

int setquantity(
  int quantity,
  int requiredquantity,
) {
  // differance between two numbers
  int diff = 0;
  if (quantity > requiredquantity) {
    diff = quantity - requiredquantity;
  } else {
    diff = 0;
  }
  return diff;
}

String setstatus(int quantity) {
  // Add your function code here!
  String status;
  if (quantity <= 0) {
    status = "Sold";
  } else {
    status = "Active";
  }
  return status;
}

int returnzero() {
  return 0;
}
