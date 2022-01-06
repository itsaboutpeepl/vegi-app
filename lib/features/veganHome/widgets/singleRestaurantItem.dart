import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';

class SingleRestaurantItem extends StatefulWidget {
  const SingleRestaurantItem({
    Key? key,
    required String this.imageURL,
    required this.name,
    required this.category,
    required this.costLevel,
    required this.deliveryTime,
    required this.rating,
    required this.address,
  }) : super(key: key);

  final String name;
  final String imageURL;
  final String category;
  final String costLevel;
  final String deliveryTime;
  final String rating;
  final String address;

  @override
  _SingleRestaurantItemState createState() => _SingleRestaurantItemState();
}

class _SingleRestaurantItemState extends State<SingleRestaurantItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(widget.imageURL),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: Text(
                        widget.costLevel,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.deliveryTime,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_outline_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.rating,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      onTap: () => context.router.push(RestaurantMenuScreen()),
    );
  }
}
