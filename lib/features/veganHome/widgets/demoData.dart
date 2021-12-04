import 'package:vegan_liverpool/models/restaurant/menuItem.dart';

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

final MenuItem bagel1 = new MenuItem(
  name: "Blueberry Bagel",
  imageURLs: [
    "https://www.bakerita.com/wp-content/uploads/2015/02/Blueberry-Bagels-8.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg"
  ],
  category: "Bakery",
  price: 3.9,
  description:
      "Freshiy Baked Bagel made with a mix of wild and cultured blueberries baked inside",
  options: {
    "Cream Cheese": 1.0,
    "Extra Blueberries": 1.85,
    "Extra Baked": 2.35,
    "Extra Love": 5.0,
    "Addon - Maple Syrup": 2.3,
    "Addon - Strawberry Syrup": 2.3,
    "Addon - Apple Syrup": 2.3,
    "Addon - Mango Syrup": 2.3,
    "Addon - Banana Syrup": 2.3,
    "Addon - Blueberry Syrup": 2.3,
    "Addon - Orange Syrup": 2.3
  },
);

final MenuItem bagel2 = new MenuItem(
  name: "Poppy Seed Bagel",
  imageURLs: [
    "https://www.bakerita.com/wp-content/uploads/2015/02/Blueberry-Bagels-8.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg"
  ],
  category: "Bakery",
  price: 3.9,
  description:
      "Freshiy Baked Bagel made with a mix of wild and cultured poppy seeds",
  options: {
    "Cream Cheese": 1.0,
    "Extra Blueberries": 1.85,
    "Extra Baked": 2.35,
    "Extra Love": 5.0,
    "Addon - Maple Syrup": 2.3,
    "Addon - Strawberry Syrup": 2.3,
    "Addon - Apple Syrup": 2.3,
    "Addon - Mango Syrup": 2.3,
    "Addon - Banana Syrup": 2.3,
    "Addon - Blueberry Syrup": 2.3,
    "Addon - Orange Syrup": 2.3
  },
);

final MenuItem bagel3 = new MenuItem(
  name: "Everything Bagel",
  imageURLs: [
    "https://www.bakerita.com/wp-content/uploads/2015/02/Blueberry-Bagels-8.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg",
    "https://images.kitchenstories.io/communityImages/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540/4a1a3db06ed03e8fc549a134983353d4_97f73b4a-0b32-4e1d-9bc7-d56df4f51540-large-landscape-150.jpg"
  ],
  category: "Bakery",
  price: 3.9,
  description:
      "Freshiy Baked Bagel made with a mix of poppy seeds, flax seeds, chia seeds, sesame seeds, onion flakes, garlic flakes, sunflower seeds, caraway seeds, pretzel salt, and black pepper.",
  options: {
    "Cream Cheese": 1.0,
    "Extra Blueberries": 1.85,
    "Extra Baked": 2.35,
    "Extra Love": 5.0,
    "Addon - Maple Syrup": 2.3,
    "Addon - Strawberry Syrup": 2.3,
    "Addon - Apple Syrup": 2.3,
    "Addon - Mango Syrup": 2.3,
    "Addon - Banana Syrup": 2.3,
    "Addon - Blueberry Syrup": 2.3,
    "Addon - Orange Syrup": 2.3
  },
);

List<MenuItem> bagels = [bagel1, bagel2, bagel3];
