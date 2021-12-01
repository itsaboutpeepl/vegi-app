import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VeganHomeScreen extends StatefulWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreen> createState() => _VeganHomeScreenState();
}

class _VeganHomeScreenState extends State<VeganHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 5,
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      body: featuredRestaurants(),
    );
  }
}

Widget featuredRestaurants() {
  return ListView.separated(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (_, __) => singleFeaturedRestaurant(_),
    separatorBuilder: (_, __) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}

Widget singleFeaturedRestaurant(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: NetworkImage(listOfFeaturedRestImageURLs[0]),
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "Da Cimino",
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
                    "\$\$",
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
                      "45-120 Min",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
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
                      "4.5",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

List<String> listOfFeaturedRestImageURLs = [
  "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
  "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322303/selection-of-chinese-food-that-may-cause-chinese-restaurant-syndrome.jpg",
  "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9442.jpg",
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Ffood.ndtv.com%2Ffood-drinks%2F6-restaurant-leftovers-you-must-avoid-eating-the-next-day-1781028&psig=AOvVaw13dr4g4gRTttn-ye7WK8Oa&ust=1638468331189000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPiE_aiYw_QCFQAAAAAdAAAAABAX"
];
