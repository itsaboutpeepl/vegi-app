import 'package:flutter/material.dart';

// List<String> listOfFeaturedRestImageURLs = [
//   "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
//   "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322303/selection-of-chinese-food-that-may-cause-chinese-restaurant-syndrome.jpg",
//   "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9442.jpg",
//   "https://cdn.pixabay.com/photo/2018/03/21/06/54/food-3245765_1280.jpg",
// ];

class VeganHomeScreen extends StatefulWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreen> createState() => _VeganHomeScreenState();
}

class _VeganHomeScreenState extends State<VeganHomeScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  // ScrollController? _scrollController;

  @override
  void initState() {
    //_tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }

//   Widget featuredRestaurants() {
//     return SliverToBoxAdapter(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20),
//             child: Text(
//               "Featured",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.34,
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               scrollDirection: Axis.horizontal,
//               itemCount: 4,
//               itemBuilder: (context, index) =>
//                   singleFeaturedRestaurant(listOfFeaturedRestImageURLs[2]),
//               separatorBuilder: (_, __) => Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget singleFeaturedRestaurant(String imageUrl) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Material(
//           borderRadius: BorderRadius.circular(30),
//           elevation: 20,
//           child: GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MenuScreen()),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Image(
//                 image: NetworkImage(imageUrl),
//                 width: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           "Da Cimino",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Text(
//                       "\$\$",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.timer_rounded,
//                           size: 20,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "45-120 Min",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                       child: Row(
//                     children: [
//                       Icon(
//                         Icons.star_outline_rounded,
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "4.5",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   Widget foodCategoryTabs() {
//     return SliverPersistentHeader(
//       delegate: SliverTabBarHeader(
//         tabBar: TabBar(
//           indicator: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(),
//             color: Colors.yellow[400],
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           isScrollable: true,
//           unselectedLabelColor: Colors.black,
//           labelColor: Colors.black,
//           tabs: [
//             tabItem(tabName: "All"),
//             tabItem(tabName: "Pizza", icon: Icons.ac_unit),
//             tabItem(tabName: "Pizza", icon: Icons.ac_unit),
//             tabItem(tabName: "Pizza", icon: Icons.ac_unit),
//             tabItem(tabName: "Pizza", icon: Icons.ac_unit),
//             tabItem(tabName: "Pizza", icon: Icons.ac_unit),
//           ],
//           controller: _tabController,
//         ),
//       ),
//       floating: true,
//     );
//   }

//   Widget foodCategoryTab() {
//     return SliverPadding(
//       padding: EdgeInsets.only(left: 20.0),
//       sliver: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (_, index) => singleRestaurantItem(listOfFeaturedRestImageURLs[0]),
//           childCount: 5,
//         ),
//       ),
//     );
//   }

//   // ListView.separated(
//   //     scrollDirection: Axis.vertical,
//   //     shrinkWrap: true,
//   //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//   //     itemCount: 4,
//   //     itemBuilder: (context, index) =>
//   //         singleRestaurantItem(listOfFeaturedRestImageURLs[0]),
//   //     separatorBuilder: (_, __) => Padding(
//   //       padding: EdgeInsets.symmetric(vertical: 20),
//   //     ),
//   //   );

//   Widget singleRestaurantItem(String imageUrl) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Material(
//           borderRadius: BorderRadius.circular(30),
//           elevation: 20,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Image(
//               image: NetworkImage(imageUrl),
//               width: MediaQuery.of(context).size.width * 0.9,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           "Da Cimino",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Text(
//                       "\$\$",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.timer_rounded,
//                           size: 20,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "45-120 Min",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[400]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 32,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.star_outline_rounded,
//                           size: 20,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "4.5",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }
// }

// Widget tabItem({IconData? icon, required String tabName}) {
//   return Tab(
//     iconMargin: EdgeInsets.zero,
//     child: Row(
//       children: [
//         icon != null
//             ? Icon(
//                 icon,
//                 size: 20,
//               )
//             : Padding(padding: EdgeInsets.zero),
//         icon != null
//             ? SizedBox(
//                 width: 5,
//               )
//             : Padding(padding: EdgeInsets.zero),
//         Text(
//           tabName,
//           style: TextStyle(fontWeight: FontWeight.w900),
//         ),
//       ],
//     ),
//   );
}
