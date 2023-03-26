import 'dart:io';

import 'package:event_management_mobile/core/service/http_service_impl.dart';
import 'package:event_management_mobile/feature/event_booking/views/event_listing.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
    theme: FlexColorScheme.light(useMaterial3: true).toTheme,
    darkTheme: FlexColorScheme.dark(useMaterial3: true).toTheme,
    home: const EventListing(),
  ));
}
