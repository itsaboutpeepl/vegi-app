import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/editAddressView.dart';

class NewAddressCard extends StatelessWidget {
  const NewAddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: themeShade400,
                  child: IconButton(
                    iconSize: 35,
                    padding: EdgeInsets.zero,
                    onPressed: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (context) => AddressView(),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "New Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
