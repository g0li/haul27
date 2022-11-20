import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: Hero(
        tag: 'orange',
        child: ElevatedButton(
            child: const Icon(
              Icons.pedal_bike,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 175,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Obx(() => controller.lines.isEmpty
                    ? const CircularProgressIndicator()
                    : AbsorbPointer(
                        absorbing: true,
                        child: FlutterMap(
                          mapController: controller.fMapController,
                          options: MapOptions(
                            center: LatLng(14.941481, 74.148213),
                            zoom: 11,
                          ),
                          children: [
                            TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c']),
                            PolylineLayer(polylines: controller.lines),
                          ],
                        ),
                      )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Dandeli Day 3 | Anshi National Park to Canconna'),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Distance : 80 kms'),
                      ElevatedButton(onPressed: () {}, child: Text('JOIN'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
