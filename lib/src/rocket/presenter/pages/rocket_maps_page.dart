import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keyworkds_challenger/src/widgets/sub_template_widget.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class RocketMapsPage extends StatefulWidget {
  const RocketMapsPage({Key? key}) : super(key: key);

  @override
  State<RocketMapsPage> createState() => _RocketMapsPageState();
}

class _RocketMapsPageState extends State<RocketMapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SubTemplateWidget(
      title: 'Mapa',
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center),
      ),
    );
  }
}
