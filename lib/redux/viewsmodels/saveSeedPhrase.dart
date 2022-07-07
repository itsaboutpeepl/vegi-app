import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class SaveSeedPhraseViewModel extends Equatable {
  final bool hasSavedSeedPhrase;
  final bool showBanner;

  SaveSeedPhraseViewModel({required this.hasSavedSeedPhrase, required this.showBanner});

  static SaveSeedPhraseViewModel fromStore(Store<AppState> store) {
    return SaveSeedPhraseViewModel(
      hasSavedSeedPhrase: store.state.userState.hasSavedSeedPhrase,
      showBanner: store.state.userState.showSeedPhraseBanner,
    );
  }

  @override
  List<Object> get props => [
        hasSavedSeedPhrase,
        showBanner,
      ];
}
