import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';

class SingleMenuItem extends StatefulWidget {
  const SingleMenuItem({Key? key, required this.menuItem}) : super(key: key);

  final MenuItem menuItem;

  @override
  _SingleMenuItemState createState() => _SingleMenuItemState();
}

class _SingleMenuItemState extends State<SingleMenuItem> {
  @override
  void initState() {
    super.initState();
  }

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
                  "https://cdn.pixabay.com/photo/2018/03/21/06/54/food-3245765_1280.jpg",
                ),
                errorBuilder: (context, error, stackTrace) {
                  print("ERROR:");
                  print(error);
                  print("STACKTRACE:");
                  print(stackTrace);
                  return SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.menuItem.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
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
                          context: context,
                          builder: (context) =>
                              DetailMenuItemView(menuItem: widget.menuItem),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              parseHtmlString(widget.menuItem.description),
              maxLines: 3,
            ),
            Text(widget.menuItem.price.toString()),
          ],
        ),
        onTap: () => {
          showBarModalBottomSheet(
            useRootNavigator: true,
            isDismissible: true,
            context: context,
            builder: (context) => DetailMenuItemView(menuItem: widget.menuItem),
          ),
        },
      ),
    );
  }
}
