import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/editCatchmentAreaView.dart';

class OutcodeCard extends StatefulWidget {
  const OutcodeCard({Key? key, required this.postalCode}) : super(key: key);

  final String postalCode;
  @override
  _OutcodeCardState createState() => _OutcodeCardState();
}

class _OutcodeCardState extends State<OutcodeCard> {
  // LatLng? address;
  Future<LatLng?> _tryFetchMapLocation() async {
    print("Hello from auto fill map location");

    if (widget.postalCode.isEmpty) {
      return null;
    }

    // String? postcode = 'Suggestion(description: ${widget.postalCode})';
    List<Location> possibleLocations = <Location>[];
    try {
      possibleLocations =
          await locationFromAddress('Liverpool, ${widget.postalCode}')
              .onError((error, stackTrace) => <Location>[]);
    } catch (err) {
      print('Error: $err');
    }
    ;

    if (possibleLocations.isNotEmpty) {
      // setState(() {
      //   address = LatLng(
      //     possibleLocations[0].latitude, possibleLocations[0].longitude);
      // });
      return LatLng(
          possibleLocations[0].latitude, possibleLocations[0].longitude);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng?>(
        future: _tryFetchMapLocation(),
        builder: (context, address) {
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
                    child: address.connectionState == ConnectionState.done &&
                            address.hasData
                        ? CachedNetworkImage(
                            imageUrl: mapPreviewImage(
                                latitude: address.data!.latitude,
                                longitude: address.data!.longitude),
                            fit: BoxFit.cover,
                          )
                        : CircleAvatar(
                            radius: 25,
                            backgroundColor: themeShade400,
                            child: IconButton(
                              iconSize: 35,
                              padding: EdgeInsets.zero,
                              // onPressed: () => {},
                              onPressed: () => showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                ),
                                context: context,
                                builder: (context) => CatchmentAreaFormView(),
                              ),
                              icon: Icon(
                                Icons.sync_problem,
                                color: Colors.grey[800],
                              ),
                            ),
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
                                child: Text('${widget.postalCode}'),
                              ),
                              Spacer(),
                              CircleAvatar(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.grey[800],
                                  ),
                                  // onPressed: () => {},
                                  onPressed: () => showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) => CatchmentAreaFormView(
                                      existingPostalCode: widget.postalCode,
                                      radiusMeters: 1000.0,
                                    ),
                                  ),
                                ),
                                backgroundColor: themeShade400,
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
        });
  }
}
