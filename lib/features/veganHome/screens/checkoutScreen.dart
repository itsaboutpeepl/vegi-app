import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/CustomAppBar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerText: "",
        pageTitle: "Checkout",
        hasSearchAction: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: addressBuilder(),
        ),
      ),
    );
  }

  Widget addressBuilder() {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                mapPreviewImage(
                    latitude: 53.40232093140704,
                    longitude: -2.9833307421239623),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String mapPreviewImage({required double latitude, required double longitude}) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyDaInwx4OK0CQ2G3dEQ5BLq4QU7W3-H6w8&style=feature:|element:|visibility:simplified';
}
