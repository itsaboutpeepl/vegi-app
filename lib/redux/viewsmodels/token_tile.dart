import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/plugins/plugins.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:redux/redux.dart';
import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/community/community.dart';

class TokenTileViewModel extends Equatable {
  final List<Community> communities;
  final Map<String, String> tokensImages;
  final Function(Token token) fetchTokenAction;
  final Function(Token token) fetchTokenPrice;
  final Plugins plugins;

  TokenTileViewModel({
    required this.communities,
    required this.plugins,
    required this.tokensImages,
    required this.fetchTokenAction,
    required this.fetchTokenPrice,
  });

  static TokenTileViewModel fromStore(Store<AppState> store) {
    String communityAddress = store.state.cashWalletState.communityAddress;
    Community? community =
        store.state.cashWalletState.communities[communityAddress];
    return TokenTileViewModel(
      plugins: community?.plugins ?? Plugins(),
      tokensImages: store.state.swapState.tokensImages,
      communities: store.state.cashWalletState.communities.values.toList(),
      fetchTokenAction: (Token token) {
        store.dispatch(getTokenWalletActionsCall(token));
      },
      fetchTokenPrice: (Token token) {
        store.dispatch(getTokenPriceCall(token));
      },
    );
  }

  @override
  List<Object> get props => [
        communities,
        tokensImages,
        plugins,
      ];
}
