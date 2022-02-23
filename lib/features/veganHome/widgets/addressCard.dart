import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/editAddressView.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({Key? key, required this.address}) : super(key: key);

  final DeliveryAddresses address;
  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
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
                imageUrl: mapPreviewImage(
                    latitude: widget.address.latitude,
                    longitude: widget.address.longitude),
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
                          child: Text(
                              '${widget.address.houseNumber}, \n${widget.address.postalCode}'),
                        ),
                        Spacer(),
                        CircleAvatar(
                          child: IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                            ),
                            onPressed: () => showBarModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              isDismissible: true,
                              enableDrag: false,
                              useRootNavigator: true,
                              context: context,
                              builder: (context) => AddressView(
                                existingAddress: widget.address,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.yellow[400],
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
