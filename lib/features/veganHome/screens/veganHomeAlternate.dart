import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegan_liverpool/features/veganHome/screens/veganHome.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/veganSliverAppBar.dart';

List<String> listOfFeaturedRestImageURLs = [
  "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
  "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322303/selection-of-chinese-food-that-may-cause-chinese-restaurant-syndrome.jpg",
  "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9442.jpg",
  "https://cdn.pixabay.com/photo/2018/03/21/06/54/food-3245765_1280.jpg",
];

List<String> veganCategories = [
  "https://cf.ltkcdn.net/vegetarian/images/orig/228069-2121x1414-Rye-bread-with-seeds.jpg",
  "https://www.timeoutdubai.com/cloud/timeoutdubai/2021/09/12/aBYJmzdH-800-Pizza-1.jpg"
];

List<String> veganCategoryNames = ["Bakery", "Pizza"];

class VeganHomeScreenAlternate extends StatefulWidget {
  const VeganHomeScreenAlternate({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreenAlternate> createState() =>
      _VeganHomeScreenAlternateState();
}

class _VeganHomeScreenAlternateState extends State<VeganHomeScreenAlternate>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          VeganSliverAppBar(),
          categorySlider(),
          featuredRestaurantsHeader(),
          featuredRestaurantsList(),
        ],
      ),
    );
  }

  Widget categorySlider() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Cravings",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) => singleFoodCategory(
                  veganCategories[index], veganCategoryNames[index]),
              separatorBuilder: (_, __) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleFoodCategory(String imageUrl, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: NetworkImage(imageUrl),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Widget featuredRestaurantsHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
        child: Text(
          "Featured",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget featuredRestaurantsList() {
    return SliverToBoxAdapter(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 4,
        itemBuilder: (context, index) =>
            singleRestaurantItem(listOfFeaturedRestImageURLs[0]),
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }

  Widget singleRestaurantItem(String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: NetworkImage(imageUrl),
              width: MediaQuery.of(context).size.width * 0.9,
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
}
