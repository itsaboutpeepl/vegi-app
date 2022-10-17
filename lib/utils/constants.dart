import 'package:vegan_liverpool/constants/addresses.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';

//TODO: Move to constants

const String wethTokenAddress = '0xa722c13135930332eb3d749b2f0906559d2c5b99';
const String wbtcTokenAddress = '0x33284f95ccb7b948d9d352e1439561cf83d8d00d';
const String wfuseTokenAddress = '0x0be9e53fd7edac9f859882afdda116645287c629';

final Token fuseToken = Token(
  name: 'Fuse',
  symbol: 'FUSE',
  imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-token.png',
  decimals: 18,
  address: Addresses.zeroAddress,
  isNative: true,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token GBPxToken = Token(
  name: 'GBPx',
  symbol: 'GBPX',
  // imageUrl: "https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png",
  decimals: 18,
  address: Addresses.gbpxTokenAddress,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token PeeplToken = Token(
  name: 'Peepl',
  symbol: 'PPL',
  // imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-token.png',
  decimals: 18,
  address: Addresses.pplTokenAddress,
  isNative: false,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);

final Token fuseDollarToken = Token(
  name: 'Fuse Dollar',
  symbol: 'fUSD',
  imageUrl: 'https://fuselogo.s3.eu-central-1.amazonaws.com/fuse-dollar.png',
  decimals: 18,
  address: Addresses.fusdTokenAddress,
  timestamp: 0,
  amount: BigInt.zero,
  walletActions: WalletActions.initial(),
);
