import 'package:expandable_sliver_list/expandable_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

class MenuStickyHeader extends StatelessWidget {
  const MenuStickyHeader(
      {Key? key, required this.title, required this.controller})
      : super(key: key);

  final String title;
  final ExpandableSliverListController<RestaurantMenuItem> controller;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: GestureDetector(
        onTap: () => controller.isCollapsed()
            ? controller.expand()
            : controller.collapse(),
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 40,
          padding: const EdgeInsets.only(left: 10, right: 5),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: themeShade200,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(2, 2),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
