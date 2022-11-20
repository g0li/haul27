import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geojson/geojson.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  MapController fMapController = MapController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    processData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final lines = <Polyline>[].obs;

  Future<void> processData() async {
    // data is from http://www.naturalearthdata.com
    final data = await rootBundle.loadString('assets/cancona.geojson');
    final geojson = GeoJson();
    geojson.processedLines.listen((GeoJsonLine line) {
      lines.add(Polyline(
          strokeWidth: 2.0,
          color: Color(0xFF0000FF),
          points: line.geoSerie!.toLatLng()));
    });
    geojson.endSignal.listen((_) => geojson.dispose());
    unawaited(geojson.parse(data, verbose: true));
  }
}
