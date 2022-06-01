import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';

RestaurantItem restaurantItem1 = new RestaurantItem(
  restaurantID: "restaurantID1",
  name: "Da Cimino",
  imageURL: "https://cdn.pixabay.com/photo/2018/03/21/06/54/food-3245765_1280.jpg",
  category: "Bakery",
  costLevel: 4,
  phoneNumber: "231321",
  description: "adsdasddasd",
  status: "active",
  deliveryRestrictionDetails: [],
  rating: 3,
  address: demoAddress,
  listOfMenuItems: [bagel1, bagel3, bagel2],
  walletAddress: "",
);

RestaurantItem restaurantItem2 = new RestaurantItem(
  restaurantID: "restaurantID2",
  name: "Veggies 'n More",
  imageURL: "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9442.jpg",
  category: "Cafe",
  costLevel: 4,
  phoneNumber: "231321",
  status: "active",
  description: "adsdasddasd",
  deliveryRestrictionDetails: [],
  rating: 3,
  address: demoAddress,
  listOfMenuItems: [bagel1, bagel2, bagel3],
  walletAddress: "",
);

RestaurantItem restaurantItem3 = new RestaurantItem(
  restaurantID: "restaurantID3",
  name: "Pita'd to Death",
  imageURL:
      "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322303/selection-of-chinese-food-that-may-cause-chinese-restaurant-syndrome.jpg",
  category: "Levantine",
  costLevel: 4,
  status: "active",
  phoneNumber: "231321",
  description: "adsdasddasd",
  deliveryRestrictionDetails: [],
  rating: 3,
  address: demoAddress,
  listOfMenuItems: [bagel3, bagel2, bagel1],
  walletAddress: "",
);

DeliveryAddresses demoAddress = new DeliveryAddresses(
  internalID: 80085,
  addressLine1: "Shop 69",
  addressLine2: "221B Baker Street",
  townCity: "Liverpool",
  postalCode: "L7 0HG",
  latitude: 3.41231123,
  longitude: 69.420,
);

RestaurantCategory restaurantCategory1 = new RestaurantCategory(
  categoryName: "Bakery",
  imageURL: "https://cf.ltkcdn.net/vegetarian/images/orig/228069-2121x1414-Rye-bread-with-seeds.jpg",
  listOfRestaurants: [restaurantItem3, restaurantItem2, restaurantItem1],
);

RestaurantCategory restaurantCategory2 = new RestaurantCategory(
  categoryName: "Vegan Food",
  imageURL:
      "https://static.vecteezy.com/system/resources/previews/001/951/881/non_2x/delicious-ham-slice-with-dish-delicious-food-isolated-icon-free-vector.jpg",
  listOfRestaurants: [restaurantItem2, restaurantItem3, restaurantItem1],
);

final RestaurantMenuItem bagel1 = new RestaurantMenuItem(
  isFeatured: true,
  menuItemID: "menuID1",
  restaurantID: "DEMO",
  name: "Something went wrong",
  imageURL: "https://picsum.photos/500",
  category: "Bakery",
  price: 390,
  description: "An error occurred",
  extras: {},
  listOfProductOptions: [],
);

final RestaurantMenuItem bagel2 = new RestaurantMenuItem(
  isFeatured: true,
  menuItemID: "menuID2",
  restaurantID: "DEMO",
  name: "Poppy Seed Bagel",
  imageURL:
      "https://marvel-b1-cdn.bc0a.com/f00000000219322/images.squarespace-cdn.com/content/v1/5eac4cadbad0a7612d8c693a/1617720715176-6EYY7BWKPD1W62SZ79L2/poppyseed+%281%29.jpg?format=1500w",
  category: "Bakery",
  price: 390,
  description: "Freshiy Baked Bagel made with a mix of wild and cultured poppy seeds",
  extras: {
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
  listOfProductOptions: demoPOCList,
);

final RestaurantMenuItem bagel3 = new RestaurantMenuItem(
  isFeatured: true,
  menuItemID: "menuID3",
  restaurantID: "DEMO",
  name: "Everything Bagel",
  imageURL: "https://healthyfitnessmeals.com/wp-content/uploads/2019/05/Keto_Parmesan_Everything_Bagel_Square_0001.jpg",
  category: "Bakery",
  price: 390,
  description:
      "Freshiy Baked Bagel made with a mix of poppy seeds, flax seeds, chia seeds, sesame seeds, onion flakes, garlic flakes, sunflower seeds, caraway seeds, pretzel salt, and black pepper.",
  extras: {
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
  listOfProductOptions: demoPOCList,
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

final ProductOptionsCategory demoPOC1 = ProductOptionsCategory(
  categoryID: 1,
  name: "Starter",
  listOfOptions: [
    new ProductOptions(
        optionID: 1,
        name: "Traditional Cullen Skink",
        description: "Smoked haddock, potato and leek soup (GF)",
        price: 0,
        isAvaliable: true),
    new ProductOptions(
        optionID: 2,
        name: "Rabbit ‘cock-a-leekie’ terrine",
        description: "A chicken, rabbit and leek terrine served with whisky jelly and oatcakes",
        price: 0,
        isAvaliable: true),
  ],
);

final ProductOptionsCategory demoPOC2 = ProductOptionsCategory(
  categoryID: 2,
  name: "Main",
  listOfOptions: [
    new ProductOptions(
        optionID: 1,
        name: "Stew",
        description: "Venison, beef and beer stew, whiskey dumplings and creamy mash",
        price: 0,
        isAvaliable: true),
    new ProductOptions(
        optionID: 2,
        name: "Lanarkshire Mushroom",
        description:
            "Lanarkshire blue portobello mushroom top hat with rumbledethump croquettes and pearl onion pickle (V)",
        price: 0,
        isAvaliable: true),
  ],
);

final List<ProductOptionsCategory> demoPOCList = [demoPOC1, demoPOC2];

OrderItem demoOrderItem1 = new OrderItem(
    internalID: 4324, menuItem: bagel3, totalItemPrice: 3242, itemQuantity: 3, selectedProductOptions: {});

OrderItem demoOrderItem2 = new OrderItem(
    internalID: 3414, menuItem: bagel1, totalItemPrice: 8922, itemQuantity: 5, selectedProductOptions: {});

final UserCart userCart = new UserCart(
  cartItems: [
    demoOrderItem1,
    demoOrderItem2,
  ],
  cartSubTotal: 502,
  cartTax: 231,
  cartTotal: 733,
  cartDiscount: 0,
);

Map<String, dynamic> testOrdersList = {
  "orders": [
    {
      "items": [
        {
          //First Object within items.
          "createdAt": 1647347017090,
          "updatedAt": 1647347017090,
          "id": 1,
          "order": 1,
          "product": {
            //Product details of first object.
            "createdAt": 1647347003870,
            "updatedAt": 1647347003870,
            "id": 1,
            "name": "Burns Night - Dine @ Home (For 1)", //Name
            "description":
                "Unfortunately, this year the 25th falls on a Monday. You won't be able to join us, so we've made our Dine@home Burns inspired instead.",
            "shortDescription": "",
            "basePrice": 2200, //Price
            "imageFd": "/Users/adam/development/peepl-app-sails/config/../assets/images/products/1.jpeg",
            "imageMime": "image/jpeg",
            "image": "",
            "isAvailable": true,
            "priority": 0,
            "vendor": 1,
            "category": 1
          },
          "optionValues": [
            //Options
            {
              //First Option Object
              "createdAt": 1647347017054,
              "updatedAt": 1647347017111,
              "id": 1,
              "option": {
                //Option details of first option object
                "createdAt": 1647347003875,
                "updatedAt": 1647347003875,
                "id": 1,
                "name": "Starter", //Name of option.
                "product": 1
              },
              "optionValue": {
                "createdAt": 1647347003880,
                "updatedAt": 1647347003880,
                "id": 3,
                "name": "Classic traditional haggis, neeps and tatties", //Value of Option
                "description": "",
                "priceModifier": 0, //Price of Option.
                "isAvailable": true,
                "option": 1
              },
              "orderItem": 1
            },
            {
              "createdAt": 1647347017064,
              "updatedAt": 1647347017111,
              "id": 2,
              "option": {"createdAt": 1647347003883, "updatedAt": 1647347003883, "id": 2, "name": "Main", "product": 1},
              "optionValue": {
                "createdAt": 1647347003886,
                "updatedAt": 1647347003886,
                "id": 6,
                "name": "Darne of Scottish salmon, kale, creamy mash and Loch Spelve mussel sauce (GF)",
                "description": "",
                "priceModifier": 0,
                "isAvailable": true,
                "option": 2
              },
              "orderItem": 1
            },
            {
              "createdAt": 1647347017070,
              "updatedAt": 1647347017111,
              "id": 3,
              "option": {
                "createdAt": 1647347003889,
                "updatedAt": 1647347003889,
                "id": 3,
                "name": "Dessert",
                "product": 1
              },
              "optionValue": {
                "createdAt": 1647347003892,
                "updatedAt": 1647347003892,
                "id": 10,
                "name": "Traditional Cranachan (V)",
                "description": "",
                "priceModifier": 0,
                "isAvailable": true,
                "option": 3
              },
              "orderItem": 1
            }
          ]
        }
      ],
      "createdAt": 1647347017080,
      "updatedAt": 1647348487779,
      "id": 1, //OrderID
      "total": 2160, //Total
      "orderedDateTime": 1647347017080, //Order DateTime from Epoch
      "paidDateTime": 1,
      "deliveryName": "Adam Galloway", //Delivered To
      "deliveryEmail": "adamgallowayy@gmail.com", //Email
      "deliveryPhoneNumber": "07495995614", //Phone
      "deliveryAddressLineOne": "17 Teck Street", //Address
      "deliveryAddressLineTwo": "", //Address
      "deliveryAddressPostCode": "L7 8RR", //Address
      "deliveryAddressInstructions": "",
      "customerWalletAddress": "test",
      "paymentStatus": "unpaid", //Status of Order
      "paymentIntentId": "b27df1fb-a90e-4d62-a8da-5f11b97f87e2",
      "isArchived": false,
      "deliveryId": "",
      "fulfilmentSlotFrom": "2022-03-03T11:00:00.000Z",
      "fulfilmentSlotTo": "2022-03-03T12:00:00.000Z",
      "publicId": "ec4802f2-f4c5-43fc-b869-d6bb8335bd8a",
      "tipAmount": 0,
      "restaurantAccepted": true,
      "fulfilmentMethod": 1,
      "discount": 1,
      "vendor": 1
    },
    {
      "items": [
        {
          "createdAt": 1647349811981,
          "updatedAt": 1647349811981,
          "id": 2,
          "order": 2,
          "product": {
            "createdAt": 1647347003870,
            "updatedAt": 1647347003870,
            "id": 1,
            "name": "Burns Night - Dine @ Home (For 1)",
            "description":
                "Unfortunately, this year the 25th falls on a Monday. You won't be able to join us, so we've made our Dine@home Burns inspired instead.",
            "shortDescription": "",
            "basePrice": 2200,
            "imageFd": "/Users/adam/development/peepl-app-sails/config/../assets/images/products/1.jpeg",
            "imageMime": "image/jpeg",
            "image": "",
            "isAvailable": true,
            "priority": 0,
            "vendor": 1,
            "category": 1
          },
          "optionValues": [
            {
              "createdAt": 1647349811921,
              "updatedAt": 1647349812002,
              "id": 4,
              "option": {
                "createdAt": 1647347003875,
                "updatedAt": 1647347003875,
                "id": 1,
                "name": "Starter",
                "product": 1
              },
              "optionValue": {
                "createdAt": 1647347003880,
                "updatedAt": 1647347003880,
                "id": 3,
                "name": "Classic traditional haggis, neeps and tatties",
                "description": "",
                "priceModifier": 0,
                "isAvailable": true,
                "option": 1
              },
              "orderItem": 2
            },
            {
              "createdAt": 1647349811949,
              "updatedAt": 1647349812002,
              "id": 5,
              "option": {"createdAt": 1647347003883, "updatedAt": 1647347003883, "id": 2, "name": "Main", "product": 1},
              "optionValue": {
                "createdAt": 1647347003886,
                "updatedAt": 1647347003886,
                "id": 6,
                "name": "Darne of Scottish salmon, kale, creamy mash and Loch Spelve mussel sauce (GF)",
                "description": "",
                "priceModifier": 0,
                "isAvailable": true,
                "option": 2
              },
              "orderItem": 2
            },
            {
              "createdAt": 1647349811957,
              "updatedAt": 1647349812002,
              "id": 6,
              "option": {
                "createdAt": 1647347003889,
                "updatedAt": 1647347003889,
                "id": 3,
                "name": "Dessert",
                "product": 1
              },
              "optionValue": {
                "createdAt": 1647347003892,
                "updatedAt": 1647347003892,
                "id": 10,
                "name": "Traditional Cranachan (V)",
                "description": "",
                "priceModifier": 0,
                "isAvailable": true,
                "option": 3
              },
              "orderItem": 2
            }
          ]
        }
      ],
      "createdAt": 1647349811969,
      "updatedAt": 1647349812196,
      "id": 2,
      "total": 2160,
      "orderedDateTime": 1647349811969,
      "paidDateTime": 1,
      "deliveryName": "Adam Galloway",
      "deliveryEmail": "adamgallowayy@gmail.com",
      "deliveryPhoneNumber": "07495995614",
      "deliveryAddressLineOne": "17 Teck Street",
      "deliveryAddressLineTwo": "",
      "deliveryAddressPostCode": "L7 8RR",
      "deliveryAddressInstructions": "",
      "customerWalletAddress": "test",
      "paymentStatus": "unpaid",
      "paymentIntentId": "20d903b4-89ae-4880-bf57-b558f8d0a97e",
      "isArchived": false,
      "deliveryId": "",
      "fulfilmentSlotFrom": "2022-03-03T11:00:00.000Z",
      "fulfilmentSlotTo": "2022-03-03T12:00:00.000Z",
      "publicId": "82d64476-8b57-42b2-82e3-3d415ca816cb",
      "tipAmount": 0,
      "restaurantAccepted": false,
      "fulfilmentMethod": 1,
      "discount": 1,
      "vendor": 1
    }
  ]
};
