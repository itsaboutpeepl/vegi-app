import 'dart:async';
import 'dart:math';
// import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart' hide Variables;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/variables.dart';
import 'package:vegan_liverpool/models/actions/actions.dart';
import 'package:vegan_liverpool/models/actions/wallet_action.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/models/tokens/price.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/connectionChecker.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/format.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:wallet_connect/wc_session_store.dart';

bool clearTokensWithZero(String key, Token token) {
  if (token.timestamp == 0) return false;
  final double formattedValue = token.amount /
      BigInt.from(
        pow(10, token.decimals),
      );
  return num.parse(formattedValue.toString()).compareTo(0) != 1;
}

class AddSession {
  AddSession(this.session);
  final WCSessionStore session;

  @override
  String toString() {
    return 'AddSession : session: $session';
  }
}

class RemoveSession {
  RemoveSession(this.session);
  final WCSessionStore session;

  @override
  String toString() {
    return 'RemoveSession : session: $session';
  }
}

class AddCashTokens {
  AddCashTokens({
    required this.tokens,
  });
  final Map<String, Token> tokens;

  @override
  String toString() {
    return 'AddCashTokens : tokens: $tokens';
  }
}

class AddCashToken {
  AddCashToken({
    required this.token,
  });
  final Token token;

  @override
  String toString() {
    return 'AddCashToken : token: $token';
  }
}

class UpdateTokenPrice {
  UpdateTokenPrice({
    required this.price,
    required this.tokenAddress,
  });
  final Price price;
  final String tokenAddress;

  @override
  String toString() {
    return 'UpdateTokenPrice : price: $price, tokenAddress: $tokenAddress';
  }
}

class GetWalletDataSuccess {
  GetWalletDataSuccess({
    required this.networks,
    required this.walletAddress,
    required this.walletModules,
  });
  final List<String> networks;
  final String walletAddress;
  final WalletModules walletModules;

  @override
  String toString() {
    return 'GetWalletDataSuccess : walletAddress: $walletAddress'
        ',networks: $networks, walletModules:'
        ' $walletModules';
  }
}

class GetTokenBalanceSuccess {
  GetTokenBalanceSuccess({
    required this.tokenBalance,
    required this.tokenAddress,
  });
  final String tokenAddress;
  final BigInt tokenBalance;

  @override
  String toString() {
    return 'GetTokenBalanceSuccess : tokenAddress: '
        '$tokenAddress, tokenBalance: $tokenBalance';
  }
}

class GetTokenIntervalStatsSuccess {
  GetTokenIntervalStatsSuccess({
    required this.intervalStats,
    required this.tokenAddress,
    required this.timeFrame,
    required this.priceChange,
  });
  final String tokenAddress;
  final List<IntervalStats> intervalStats;
  final TimeFrame timeFrame;
  final num priceChange;

  @override
  String toString() {
    return 'GetTokenIntervalStatsSuccess : tokenAddress: '
        '$tokenAddress, intervalStats: $intervalStats, '
        'timeFrame: $timeFrame, priceChange: $priceChange';
  }
}

class GetActionsSuccess {
  GetActionsSuccess({
    required this.walletActions,
    this.nextPage,
  });
  final List<WalletAction> walletActions;
  final int? nextPage;

  @override
  String toString() =>
      'GetActionsSuccess : walletActions: $walletActions, nextPage: $nextPage';
}

class GetTokenWalletActionsSuccess {
  GetTokenWalletActionsSuccess({
    required this.updateAt,
    required this.walletActions,
    required this.token,
    this.nextPage,
  });
  final Token token;
  final List<WalletAction> walletActions;
  final num updateAt;
  final int? nextPage;

  @override
  String toString() => 'GetTokenWalletActionsSuccess : token: $token, '
      'walletActions: $walletActions, updateAt: $updateAt, nextPage: $nextPage';
}

class GetTokensListSuccess {
  GetTokensListSuccess({
    required this.tokensByAddress,
  });
  final Map<String, Token> tokensByAddress;

  String get tokenNames => tokensByAddress.entries
      .map(
        (e) => e.value.name,
      )
      .join(' ');

  @override
  String toString() => 'GetTokensListSuccess : tokens: $tokenNames';
}

class StartBalanceFetchingSuccess {
  StartBalanceFetchingSuccess();

  @override
  String toString() {
    return 'StartBalanceFetchingSuccess';
  }
}

class SetIsTransfersFetching {
  SetIsTransfersFetching({
    required this.isFetching,
  });
  final bool isFetching;

  @override
  String toString() {
    return 'SetIsTransfersFetching : isFetching: $isFetching';
  }
}

class ResetTokenTxs {
  ResetTokenTxs();

  @override
  String toString() {
    return 'ResetTokenTxs';
  }
}

class SetIsFetchingBalances {
  SetIsFetchingBalances({
    required this.isFetching,
  });
  final bool isFetching;

  @override
  String toString() {
    return 'SetIsFetchingBalances : isFetching: $isFetching';
  }
}

class FetchNewPage {
  FetchNewPage({required this.page});
  final int page;

  @override
  String toString() {
    return 'FetchNewPage : page: $page';
  }
}

// ThunkAction<AppState> enablePushNotifications(String walletAddress) {
//   return (Store<AppState> store) async {
//     try {
//       await getIt<FirebaseMessaging>().requestPermission();
//       final String? token = await getIt<FirebaseMessaging>().getToken();
//       if (token != null) {
//         log.info('Firebase messaging token $token');
//         await chargeApi.updateFirebaseToken(walletAddress,
//             token); //! remove as firebase now separate to fuse sdk?
//       }
//     } catch (e, s) {
//       log.error(
//         'ERROR - Enable push notifications: $e',
//         error: e,
//         stackTrace: s,
//       );
//       await Sentry.captureException(
//         Exception('ERROR - Enable push notifications: $e'),
//         stackTrace: s,
//         hint: 'ERROR - Enable push notifications',
//       );
//     }
//   };
// }

ThunkAction<AppState> getTokensListForSmartWallet(
  void Function(String) onError,
) {
  return (Store<AppState> store) async {
    try {
      final tokensAccessibleToSmartWallet =
          await fuseWalletSDK.tradeModule.fetchTokens();
      tokensAccessibleToSmartWallet.pick(
        onData: (List<TokenDetails> tokens) {
          // Do you magic here
          store.dispatch(
            GetTokensListSuccess(
              tokensByAddress: Map.fromEntries(
                tokens.map(
                  (e) => MapEntry(
                    e.address,
                    Token(
                      address: e.address,
                      name: e.name,
                      symbol: e.symbol,
                      decimals: e.decimals,
                      timestamp: 0,
                      amount: BigInt.from(0.0),
                      walletActions: WalletActions.initial(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        onError: (err) {
          onError(err.toString());
        },
      );
    } catch (e, s) {
      log.error('ERROR - getTokensListForSmartWallet $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getTokensListForSmartWallet $e',
      );
      onError(
        'ERROR - getTokensListForSmartWallet $e',
      );
    }
  };
}

ThunkAction<AppState> startFetchTokensBalances() {
  return (Store<AppState> store) async {
    final bool isFetchingBalances =
        store.state.cashWalletState.isFetchingBalances;
    final String walletAddress = store.state.userState.walletAddress;
    if (!isFetchingBalances) {
      log.info('Start Fetching token balances');
      Timer.periodic(
        const Duration(seconds: Variables.intervalSeconds),
        (Timer timer) async {
          final bool isLoggedOut = store.state.userState.isLoggedOut;
          if (isLoggedOut) {
            log.info('Stop fetching token balances as logged out.');
            store.dispatch(SetIsFetchingBalances(isFetching: false));
            timer.cancel();
          }
          final String currentWalletAddress =
              store.state.userState.walletAddress;
          if (currentWalletAddress != walletAddress) {
            log.error('Timer stopped - startFetchTokensBalances');
            store.dispatch(SetIsFetchingBalances(isFetching: false));
            timer.cancel();
          } else {
            final NetworkInfo networkInfo = getIt<NetworkInfo>();
            if (await networkInfo.isConnected) {
              try {
                final Map<String, Token> tokens =
                    store.state.cashWalletState.tokens;
                for (final Token token in tokens.values) {
                  await token.fetchBalance(
                    walletAddress,
                    onDone: (balance) {
                      if (balance.compareTo(token.amount) != 0) {
                        store.dispatch(
                          GetTokenBalanceSuccess(
                            tokenBalance: balance,
                            tokenAddress: token.address,
                          ),
                        );
                      }
                    },
                    onError: (
                      Object e,
                      StackTrace s,
                    ) {
                      log.error(
                        'Error - fetch token balance ${token.name}',
                        error: e,
                        stackTrace: s,
                      );
                    },
                  );
                }
              } catch (e, s) {
                log.error(
                  'Error fetch tokens balances - ${e.toString()}',
                  error: e,
                  stackTrace: s,
                );
                await Sentry.captureException(
                  Exception('Error fetch tokens balances - $e'),
                  stackTrace: s,
                  hint: 'Error fetch tokens balances',
                );
              }
            } else {
              log.error("Looks like you're offline");
            }
          }
        },
      );
      store.dispatch(SetIsFetchingBalances(isFetching: true));
    }
  };
}
