// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:vegan_liverpool/constants/addresses.dart';

// class ImageUrl {
//   static bool _isIpfsHash(String hash) => hash.length == 46;
//   static bool _isS3Hash(String hash) => hash.length == 64;

//   static String getLink(String? hash) {
//     if (hash != null) {
//       if (_isIpfsHash(hash)) {
//         return getIPFSImageUrl(hash);
//       } else if (_isS3Hash(hash)) {
//         return getS3ImageUrl(hash);
//       }
//     }
//     return 'https://cdn3.iconfinder.com/data/icons/abstract-1/512/no_image-512.png';
//   }

//   // static ImageProvider getContactImage(
//   //   Contact? contact,
//   // ) {
//   //   if (contact?.avatar != null) {
//   //     return new MemoryImage(contact?.avatar as Uint8List);
//   //   }
//   //   return new AssetImage('assets/images/anom.png');
//   // }

//   // static String getIPFSImageUrl(String? image) {
//   //   if (image == null) {
//   //     return 'https://cdn3.iconfinder.com/data/icons/abstract-1/512/no_image-512.png';
//   //   }
//   //   return dotenv.env['IPFS_BASE_URL']! + '/image/' + image;
//   // }

//   static String getS3ImageUrl(String? image) {
//     if (image == null) {
//       return 'https://cdn3.iconfinder.com/data/icons/abstract-1/512/no_image-512.png';
//     }
//     return '${dotenv.env['FUSE_S3_BUCKET']}/$image';
//   }

//   static String getTokenUrl(tokenAddress) {
//     return tokenAddress == Addresses.zeroAddress
//         ? 'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/info/logo.png'
//         : "https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/$tokenAddress/logo.png";
//   }

//   static String? getTokenByAddress(
//     String? address,
//     Map<String, String>? tokensImages,
//   ) {
//     return tokensImages?[address?.toLowerCase()];
//   }
// }
