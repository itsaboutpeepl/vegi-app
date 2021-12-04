import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';

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
    "https://www.gnom-gnom.com/wp-content/uploads/2018/07/Gluten-Free-Paleo-Keto-Blueberry-Bagels-by-Gnom-Gnom-8-683x1024-1.jpg"
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
    "https://img.taste.com.au/DGaf7toO/taste/2016/11/poppy-seed-bagels-74845-1.jpeg",
    "https://marvel-b1-cdn.bc0a.com/f00000000219322/images.squarespace-cdn.com/content/v1/5eac4cadbad0a7612d8c693a/1617720715176-6EYY7BWKPD1W62SZ79L2/poppyseed+%281%29.jpg?format=1500w",
    "http://www.thesugarhit.com/wp-content/uploads/2014/03/IMG_1698.jpg"
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
    "https://simmerandsauce.com/wp-content/uploads/2019/02/fullsizeoutput_1badf.jpeg",
    "https://www.spoonforkbacon.com/wp-content/uploads/2019/02/mini_everything_bagels.jpg"
        "https://healthyfitnessmeals.com/wp-content/uploads/2019/05/Keto_Parmesan_Everything_Bagel_Square_0001.jpg"
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

final UserCart userCart = new UserCart(
  cartItems: [bagel1, bagel2, bagel3],
  cartItemQuantities: {
    "Blueberry Bagel": 4,
    "Everything Bagel": 2,
    "Poppy Seed Bagel": 5
  },
  cartSubTotal: 5.02,
  cartTax: 2.31,
  cartTotal: 7.33,
  cartDiscount: 0,
);
