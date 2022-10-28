import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class DetailsCardViewModel extends Equatable {
  const DetailsCardViewModel({
    required this.hasEmail,
    required this.name,
    required this.phone,
    required this.email,
    required this.updateDetails,
  });

  factory DetailsCardViewModel.fromStore(Store<AppState> store) {
    return DetailsCardViewModel(
      hasEmail: store.state.userState.email.isNotEmpty,
      name: store.state.userState.displayName,
      phone: store.state.userState.phoneNumber,
      email: store.state.userState.email,
      updateDetails: ({required email, required name}) {
        store
          ..dispatch(SetDisplayName(name))
          ..dispatch(SetEmail(email));
      },
    );
  }

  final bool hasEmail;
  final String name;
  final String phone;
  final String email;
  final void Function({required String name, required String email})
      updateDetails;

  @override
  List<Object?> get props => [name, phone, email];
}
