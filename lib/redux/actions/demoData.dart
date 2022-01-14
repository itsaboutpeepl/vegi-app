import 'package:vegan_liverpool/models/restaurant/menuItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';

RestaurantItem restaurantItem1 = new RestaurantItem(
  restaurantID: "restaurantID1",
  name: "Da Cimino",
  imageURL:
      "https://cdn.pixabay.com/photo/2018/03/21/06/54/food-3245765_1280.jpg",
  category: "Bakery",
  costLevel: "\$\$",
  deliveryTime: "45-120 Min",
  rating: "3.5",
  address: "Liverpool, L17 0AB",
  listOfMenuItems: [bagel1, bagel3, bagel2],
);

RestaurantItem restaurantItem2 = new RestaurantItem(
  restaurantID: "restaurantID2",
  name: "Veggies 'n More",
  imageURL:
      "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9442.jpg",
  category: "Cafe",
  costLevel: "\$\$\$",
  deliveryTime: "30-60 Min",
  rating: "2.5",
  address: "Liverpool, L11 0AB",
  listOfMenuItems: [bagel1, bagel2, bagel3],
);

RestaurantItem restaurantItem3 = new RestaurantItem(
  restaurantID: "restaurantID3",
  name: "Pita'd to Death",
  imageURL:
      "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322303/selection-of-chinese-food-that-may-cause-chinese-restaurant-syndrome.jpg",
  category: "Levantine",
  costLevel: "\$\$",
  deliveryTime: "45-90 Min",
  rating: "4.5",
  address: "Liverpool, L99 5AB",
  listOfMenuItems: [bagel3, bagel2, bagel1],
);

RestaurantCategory restaurantCategory1 = new RestaurantCategory(
  categoryName: "Bakery",
  imageURL:
      "https://cf.ltkcdn.net/vegetarian/images/orig/228069-2121x1414-Rye-bread-with-seeds.jpg",
  listOfRestaurants: [restaurantItem3, restaurantItem2, restaurantItem1],
);

RestaurantCategory restaurantCategory2 = new RestaurantCategory(
  categoryName: "Vegan Food",
  imageURL:
      "https://static.vecteezy.com/system/resources/previews/001/951/881/non_2x/delicious-ham-slice-with-dish-delicious-food-isolated-icon-free-vector.jpg",
  listOfRestaurants: [restaurantItem2, restaurantItem3, restaurantItem1],
);

final MenuItem bagel1 = new MenuItem(
  menuID: "menuID1",
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
    "Cream Cheese": 100,
    "Extra Blueberries": 185,
    "Extra Baked": 235,
    "Extra Love": 500,
    "Addon - Maple Syrup": 230,
    "Addon - Strawberry Syrup": 230,
    "Addon - Apple Syrup": 230,
    "Addon - Mango Syrup": 230,
    "Addon - Banana Syrup": 230,
    "Addon - Blueberry Syrup": 230,
    "Addon - Orange Syrup": 230
  },
);

final MenuItem bagel2 = new MenuItem(
  menuID: "menuID2",
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
    "Cream Cheese": 100,
    "Extra Blueberries": 185,
    "Extra Baked": 235,
    "Extra Love": 500,
    "Addon - Maple Syrup": 230,
    "Addon - Strawberry Syrup": 230,
    "Addon - Apple Syrup": 230,
    "Addon - Mango Syrup": 230,
    "Addon - Banana Syrup": 230,
    "Addon - Blueberry Syrup": 230,
    "Addon - Orange Syrup": 230
  },
);

final MenuItem bagel3 = new MenuItem(
  menuID: "menuID3",
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
    "Cream Cheese": 100,
    "Extra Blueberries": 185,
    "Extra Baked": 235,
    "Extra Love": 500,
    "Addon - Maple Syrup": 230,
    "Addon - Strawberry Syrup": 230,
    "Addon - Apple Syrup": 230,
    "Addon - Mango Syrup": 230,
    "Addon - Banana Syrup": 230,
    "Addon - Blueberry Syrup": 230,
    "Addon - Orange Syrup": 230
  },
);

final Map<String, int> demoOptions = {
  "Cream Cheese": 100,
  "Extra Blueberries": 185,
  "Extra Baked": 235,
  "Extra Love": 500,
  "Addon - Maple Syrup": 230,
  "Addon - Strawberry Syrup": 230,
  "Addon - Apple Syrup": 230,
  "Addon - Mango Syrup": 230,
  "Addon - Banana Syrup": 230,
  "Addon - Blueberry Syrup": 230,
  "Addon - Orange Syrup": 230
};

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
