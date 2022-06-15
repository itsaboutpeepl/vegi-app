import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:wallet_core/wallet_core.dart' show Graph, StudioApi, WalletApi;

@module
abstract class ServicesModule {
  @lazySingleton
  Graph get graph => Graph(
        dotenv.env['GRAPH_BASE_URL']!,
        dotenv.env['NFT_SUB_GRAPH_URL'] ?? 'https://api.thegraph.com/subgraphs/name/mul53/nft-subgraph',
      );

  @lazySingleton
  StudioApi get api => StudioApi();

  @lazySingleton
  WalletApi get walletApi => WalletApi();

  @singleton
  RootRouter get rootRouter => RootRouter(authGuard: AuthGuard());
}
