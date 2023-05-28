import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/shops/shops_bloc.dart';
import '../../bloc/shops/shops_event.dart';
import '../../bloc/shops/shops_state.dart';
import '../../config/theme.dart';
import '../../model/shop_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> 
{
  final ShopsBloc _newBloc = ShopsBloc();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _mdq = CameraPosition(
    target: LatLng(-37.99355884120087, -57.5530258579142),
    zoom: 15,
  );


@override
  void initState() {
    _newBloc.add(GetLocalShopList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
      body: BlocProvider(create: (context) {
        return _newBloc;
      },child: BlocListener<ShopsBloc, ShopsState>(
                listener: (context, state) {
                  if (state is ShopsError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message!),
                    ));
                  }
                },
                child: BlocBuilder<ShopsBloc, ShopsState>(
                    builder: (context, state) {
                  if (state is ShopsInitial) {
                    return const Text('ShopsInitial');
                  } else if (state is ShopsLoading) {
                    return _buildLoading();
                  } else if (state is ShopsLoaded) {
                    return MyGoogleMapsWidget(mdq: _mdq, controller: _controller,shopList: state.list,);
                  } else if (state is ShopsError) {
                    return const Text('ShopsError');
                  } else {
                    return Container();
                  }
                }),
              ))
    );
  }
}

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());


class MyGoogleMapsWidget extends StatefulWidget 
{
  final List<ShopModel> shopList;

  const MyGoogleMapsWidget({
    super.key,
    required CameraPosition mdq,
    required Completer<GoogleMapController> controller,
    required this.shopList
  }) : _mdq = mdq, _controller = controller;

  final CameraPosition _mdq;
  final Completer<GoogleMapController> _controller;

  @override
  State<MyGoogleMapsWidget> createState() => _MyGoogleMapsWidgetState();
}

class _MyGoogleMapsWidgetState extends State<MyGoogleMapsWidget> {
  final Set<Marker> _markers  = <Marker>{};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: widget._mdq,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
        widget._controller.complete(controller);
        for (ShopModel shop in widget.shopList)
        {

        final marker = Marker(
              markerId: MarkerId(shop.nombre!),
              position: LatLng(shop.latitud!, shop.longitud!),
              // icon: BitmapDescriptor.,
              infoWindow: InfoWindow(
                title: shop.nombre!,
                snippet: shop.direccion!,
              ),
            );

            _markers.add(marker);

        }

        setState(() {
          
        });
      },
    );
  }
}