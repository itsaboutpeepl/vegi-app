import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/editAddressView.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

class DeliveryRadiusCard extends StatefulWidget {
  const DeliveryRadiusCard(
      {Key? key, required this.address, required this.radius})
      : super(key: key);

  final DeliveryAddresses address;
  final double radius;
  @override
  _DeliveryRadiusCardState createState() => _DeliveryRadiusCardState();
}

class _DeliveryRadiusCardState extends State<DeliveryRadiusCard> {
  //TODO: Add interactive map selection area to replace postcode catchment area selection

  Completer<GoogleMapController> _controller = Completer();
  static final LatLng LatLngVegiLiverpool = const LatLng(53.395729, -2.981785);
  Circle? circle = Circle(
      circleId: CircleId(LatLngVegiLiverpool.toString()),
      center: LatLng(LatLngVegiLiverpool.latitude, LatLngVegiLiverpool.longitude),
      radius: 1000.0,
      fillColor: Color.fromARGB(163, 68, 137, 255));


  @override
  void initState() {
    setState(() {
      circle = Circle(
          circleId: CircleId(widget.address.toString()),
          center: LatLng(widget.address.latitude, widget.address.longitude),
          radius: widget.radius,
          fillColor: Color.fromARGB(163, 68, 137, 255));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition:
                    CameraPosition(target: circle != null ? circle!.center : LatLngVegiLiverpool),
                circles: circle != null ? <Circle>{circle!} : <Circle>{},
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '${widget.address.label ?? widget.address.addressLine1}, \n${widget.address.postalCode}'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
