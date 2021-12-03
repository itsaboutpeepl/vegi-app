import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverTabBarHeader extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  const SliverTabBarHeader({
    Color color = Colors.transparent,
    required this.tabBar,
  }) : this.color = color;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white,
        ),
        Positioned(
          child: tabBar,
          bottom: 20,
        ),
      ],
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 70;

  @override
  double get minExtent => tabBar.preferredSize.height + 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
