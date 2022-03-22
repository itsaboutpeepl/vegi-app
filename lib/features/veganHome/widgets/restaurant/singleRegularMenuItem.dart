import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class SingleRegularMenuItem extends StatefulWidget {
  const SingleRegularMenuItem({Key? key, required this.menuItem})
      : super(key: key);

  final MenuItem menuItem;

  @override
  _SingleRegularMenuItemState createState() => _SingleRegularMenuItemState();
}

class _SingleRegularMenuItemState extends State<SingleRegularMenuItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: GestureDetector(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.3,
                      image: CachedNetworkImageProvider(
                        widget.menuItem.imageURL,
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
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                      widget.menuItem.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.menuItem.formattedPrice,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),

                  // Text(
                  //   parseHtmlString(widget.menuItem.description),
                  //   maxLines: 3,
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.menuItem.description)
            ]),
            onTap: () => {
              viewmodel.setMenuItem(widget.menuItem),
              showBarModalBottomSheet(
                useRootNavigator: true,
                isDismissible: true,
                context: context,
                builder: (context) => DetailMenuItemView(),
              ),
            },
          ),
        );
      },
    );
  }
}
