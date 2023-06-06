// import 'package:freezed_annotation/freezed_annotation.dart';

// class ApiOrder with _$ApiOrder {
//   @JsonSerializable()
//   factory ApiOrder({
//     required int id,
//     required int total,
//     required int orderedDateTime,
//     required String deliveryName,
//     required String deliveryEmail,
//     required String deliveryPhoneNumber,
//     required String deliveryAddressLineOne,
//     required String deliveryAddressLineTwo,
//     required String deliveryAddressPostCode,
//     required String paymentStatus,
//     required int rewardsIssued,
//     required String restaurantName,
//     required String restaurantPhoneNumber,
//     required String restaurantAccepted,
//     required String restaurantAcceptanceStatus,
//     required String fulfilmentMethod,


//   })

// }


// @Freezed()
// class CartItem with _$CartItem {
//   @JsonSerializable()
//   factory CartItem({
//     required int id,
//     required RestaurantMenuItem menuItem,
//     required int totalItemPrice,
//     required int itemQuantity,
//     required Map<int, ProductOptions> selectedProductOptions,
//   }) = _CartItem;

//   const CartItem._();

//   factory CartItem.fromJson(Map<String, dynamic> json) =>
//       _$CartItemFromJson(json);

//   String get formattedPrice {
//     if (menuItem.price != 0) {
//       return cFPrice(menuItem.price);
//     } else {
//       return cFPrice(totalItemPrice);
//     }
//   }
// }


/* 
0:
"items" -> List (3 items)
3:
"id" -> 578
4:
"subtotal" -> 0
5:
"total" -> 1209
6:
"orderedDateTime" -> 1663066875610
7:
"paidDateTime" -> 1663066895546
8:
"deliveryName" -> "Hussain"
9:
"deliveryEmail" -> "email@notprovided.com"
10:
"deliveryPhoneNumber" -> "12345678"
11:
"deliveryAddressLineOne" -> "Collection Order"
12:
"deliveryAddressLineTwo" -> ""
13:
"deliveryAddressPostCode" -> "L7 0HG"
14:
"deliveryAddressInstructions" -> ""
15:
"customerWalletAddress" -> "0x41190Dd82D43129C26955063fa2854350e14554B"
16:
"paymentStatus" -> "paid"
17:
"paymentIntentId" -> "6fe9e251-770e-4046-bce2-42fcd4788102"
18:
"fulfilmentSlotFrom" -> "2022-09-15T12:00:00.000Z"
19:
"fulfilmentSlotTo" -> "2022-09-15T13:00:00.000Z"
20:
"publicId" -> "7c392a3b-af66-47e1-a90f-d0b0dc8ea355"
21:
"tipAmount" -> 0
22:
"restaurantAcceptanceStatus" -> "rejected"
23:
"rewardsIssued" -> 0
24:
"sentToDeliveryPartner" -> false
25:
"fulfilmentMethod" -> 34
1:
"createdAt" -> 1663066875610
2:
"updatedAt" -> 1663079520968
26:
"discount" -> null
27:
"vendor" -> Map (22 items)

ITEM LIST
List (3 items)
[0]:
Map (6 items)
0:
"createdAt" -> 1663066875621
1:
"updatedAt" -> 1663066875621
2:
"id" -> 1475
3:
"order" -> 578
4:
"product" -> Map (13 items)
5:
"optionValues" -> List (0 items)
[1]:
Map (6 items)
0:
"createdAt" -> 1663066875621
1:
"updatedAt" -> 1663066875621
2:
"id" -> 1476
3:
"order" -> 578
4:
"product" -> Map (13 items)
5:
"optionValues" -> List (1 item)
[2]:
Map (6 items)
0:
"createdAt" -> 1663066875621
1:
"updatedAt" -> 1663066875621
2:
"id" -> 1477
3:
"order" -> 578
4:
"product" -> Map (13 items)
5:
"optionValues" -> List (0 items)

PRODUCT
0:
"createdAt" -> 1661248511673
1:
"updatedAt" -> 1661251499232
2:
"id" -> 1943
3:
"name" -> "Nutty Choc Balls"
4:
"description" -> "Similar to Ferrero rocher! Love Raw. 28g 2 pack"
5:
"shortDescription" -> ""
6:
"basePrice" -> 185
7:
"imageUrl" -> "https://vegiapp-1.s3.us-east-1.amazonaws.com/be34176a-0d51-44b8-b8d9-ac647aaed361.jpg"
8:
"isAvailable" -> true
9:
"priority" -> 487
10:
"isFeatured" -> true
11:
"vendor" -> 17
12:
"category" -> null

OptionValues
5:
"optionValues" -> List (1 item)
key:
"optionValues"
value:
List (1 item)
[0]:
Map (6 items)
0:
"createdAt" -> 1663066875603
1:
"updatedAt" -> 1663066875658
2:
"id" -> 1374
3:
"option" -> Map (6 items)
key:
"option"
value:
Map (6 items)
0:
"createdAt" -> 1661248512570
1:
"updatedAt" -> 1661248512570
2:
"id" -> 153
3:
"name" -> "Options"
4:
"isRequired" -> false
5:
"product" -> 1945
4:
"optionValue" -> Map (8 items)
key:
"optionValue"
value:
Map (8 items)
0:
"createdAt" -> 1661248515547
1:
"updatedAt" -> 1661248515547
2:
"id" -> 1010
3:
"name" -> "Sunflower spread"
4:
"description" -> "For home baking, shallow frying & sauces. 500g"
5:
"priceModifier" -> 204
6:
"isAvailable" -> true
7:
"option" -> 153
5:
"orderItem" -> 1476

VENDOR
0:
"createdAt" -> 1661248477732
1:
"updatedAt" -> 1664273100932
2:
"id" -> 17
3:
"name" -> "Purple Carrot"
4:
"type" -> "restaurant"
5:
"description" -> "Est 2014, vegan wholefoods, healthfoods and treats
286 Smithdown Road L15 5AJ"
6:
"walletAddress" -> "0xb4988530489bb1C04c9e516757e20e693FEC048c"
7:
"imageUrl" -> "https://vegiapp-1.s3.us-east-1.amazonaws.com/d4214fc1-5c3c-4b67-9698-f86d5bd41489.png"
8:
"status" -> "active"
9:
"phoneNumber" -> "+447917787967"
10:
"pickupAddressLineOne" -> "286 Smithdown Road"
11:
"pickupAddressLineTwo" -> null
12:
"pickupAddressCity" -> null
13:
"pickupAddressPostCode" -> "L15 5AJ"
14:
"costLevel" -> null
15:
"rating" -> 0
16:
"isVegan" -> true
17:
"minimumOrderAmount" -> 500
18:
"platformFee" -> 125
19:
"collectionFulfilmentMethod" -> 34
20:
"deliveryFulfilmentMethod" -> 33
21:
"deliveryPartner" -> 1
*/