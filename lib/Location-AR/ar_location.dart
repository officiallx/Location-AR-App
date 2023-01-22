import 'package:ar_location_view/ar_location_widget.dart';
import 'package:ar_location_view/ar_radar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'annotation.dart';
import 'homepage.dart';

class LocationARView extends StatefulWidget {
  const LocationARView({super.key});

  @override
  State<LocationARView> createState() => _LocationARViewState();
}

class _LocationARViewState extends State<LocationARView> {
  List<Annotation> annotations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArLocationWidget(
        annotations: annotations,
        showDebugInfoSensor: false,
        annotationWidth: 180,
        annotationHeight: 40,
        radarPosition: RadarPosition.bottomLeft,
        radarWidth: 160,
        scaleWithDistance: false,
        annotationViewBuilder: (context, annotation) {
          return AnnotationView(
            key: ValueKey(annotation.uid),
            annotation: annotation as Annotation,
          );
        },
        onLocationChange: (Position position) {
          Future.delayed(const Duration(seconds: 5), () {
            annotations = fakeAnnotation(position: position, numberMaxPoi: 50);
            setState(() {});
          });
        },
      ),
    );
  }
}
