import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.dart';

class SingleCategoryItem extends StatefulWidget {
  const SingleCategoryItem(
      {Key? key, required this.imageURL, required this.title})
      : super(key: key);
  final String imageURL;
  final String title;

  @override
  _SingleCategoryItemState createState() => _SingleCategoryItemState();
}

class _SingleCategoryItemState extends State<SingleCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(TestPeeplPay()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 300,
                height: 200,
                child: Image(
                  fit: BoxFit.contain,
                  image: CachedNetworkImageProvider(widget.imageURL),
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
