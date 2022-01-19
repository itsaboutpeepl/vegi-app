import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PickUpCard extends StatefulWidget {
  const PickUpCard({Key? key}) : super(key: key);

  @override
  _PickUpCardState createState() => _PickUpCardState();
}

class _PickUpCardState extends State<PickUpCard> {
  String _mapPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyDaInwx4OK0CQ2G3dEQ5BLq4QU7W3-H6w8&style=feature:|element:|visibility:simplified';
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
              child: CachedNetworkImage(
                imageUrl: _mapPreviewImage(
                    latitude: 53.40232093140704,
                    longitude: -2.9833307421239623),
                fit: BoxFit.cover,
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
                          child: Text('Name of Restaurant, \nL4 WR5'),
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