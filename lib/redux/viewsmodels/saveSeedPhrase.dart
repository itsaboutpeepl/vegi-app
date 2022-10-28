import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class SaveSeedPhraseViewModel extends Equatable {
  const SaveSeedPhraseViewModel({
    required this.hasSavedSeedPhrase,
    required this.showBanner,
  });

  factory SaveSeedPhraseViewModel.fromStore(Store<AppState> store) {
    return SaveSeedPhraseViewModel(
      hasSavedSeedPhrase: store.state.userState.hasSavedSeedPhrase,
      showBanner: store.state.userState.showSeedPhraseBanner,
    );
  }

  final bool hasSavedSeedPhrase;
  final bool showBanner;

  @override
  List<Object> get props => [
        hasSavedSeedPhrase,
        showBanner,
      ];
}
