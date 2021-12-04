import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/detailMenuItemView.dart';

import 'demoData.dart';

class SingleMenuItem extends StatefulWidget {
  const SingleMenuItem({Key? key}) : super(key: key);

  @override
  _SingleMenuItemState createState() => _SingleMenuItemState();
}

class _SingleMenuItemState extends State<SingleMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text(
                    'Random Meal',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.yellow[400],
                    child: IconButton(
                      onPressed: () {
                        showBarModalBottomSheet(
                          useRootNavigator: true,
                          backgroundColor: Colors.cyan,
                          context: context,
                          builder: (context) =>
                              DetailMenuItemView(menuItem: bagel1),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Text('Even Randomer description'),
            Text('\$1.49'),
          ],
        ),
        onTap: () => {
          showBarModalBottomSheet(
            useRootNavigator: true,
            backgroundColor: Colors.cyan,
            context: context,
            builder: (context) => DetailMenuItemView(menuItem: bagel1),
          ),
        },
      ),
    );
  }
}
