import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keyworkds_challenger/src/rocket/domain/entities/rocket_launch.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_bloc.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_event.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_state.dart';
import 'package:keyworkds_challenger/src/widgets/sub_template_widget.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class RocketMapsPage extends StatefulWidget {
  const RocketMapsPage({Key? key}) : super(key: key);

  @override
  State<RocketMapsPage> createState() => _RocketMapsPageState();
}

class _RocketMapsPageState extends State<RocketMapsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.538336, -81.379234);

  final rocketBloc = Modular.get<RocketBloc>();

  var bitmapDecriptor = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      rocketBloc.add(GetNextFourRocketsEvent());
    });
  }

  var markers = Set<Marker>();

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  void _onMapCreated(GoogleMapController controller, List<RocketLaunch> rocketsLaunch) async {
    for (var rocketLaunch in rocketsLaunch) {
      markers.add(Marker(
          icon: await getBytesFromAsset('lib\\assets\\icons\\rocket_launch_red.png', 128)
              .then((value) => BitmapDescriptor.fromBytes(value)),
          markerId: MarkerId(rocketLaunch.launchPadId),
          position: LatLng(
            double.parse(rocketLaunch.latitude),
            double.parse(rocketLaunch.longitude),
          ),
          infoWindow: InfoWindow(
            title: rocketLaunch.name,
            snippet: rocketLaunch.address,
          )));
    }

    setState(() {});

    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SubTemplateWidget(
      title: 'Mapa',
      child: BlocBuilder<RocketBloc, RocketState>(
        bloc: rocketBloc,
        builder: (ctx, state) {
          if (state is LoadingRocketState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorRocketState) {
            return const Center(
              child: Text('Erro ao carregar dados'),
            );
          }

          if (state is SuccessRocketState) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(target: _center, zoom: 7),
              markers: markers,
              onMapCreated: (controller) {
                _onMapCreated(controller, state.rocketsLaunch);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
