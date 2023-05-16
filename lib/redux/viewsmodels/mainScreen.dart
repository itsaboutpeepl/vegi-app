import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_number/phone_number.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class MainScreenViewModel extends Equatable implements IAuthViewModel {
  const MainScreenViewModel({
    required this.walletAddress,
    required this.userIsVerified,
    required this.loggedIn,
    required this.loggedInToVegi,
    required this.hasLoggedInBefore,
    required this.surveyCompleted,
    required this.dialCode,
    required this.countryCode,
    required this.phoneNumber,
    required this.phoneNumberNoCountry,
    required this.isSuperAdmin,
    required this.firebaseSessionToken,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.setPhoneNumber,
    required this.signup,
    required this.setUserIsLoggedOut,
  });

  factory MainScreenViewModel.fromStore(Store<AppState> store) {
    return MainScreenViewModel(
      walletAddress:
          store.state.userState.walletAddress, //.replaceFirst('x', 'f'),
      userIsVerified: store.state.userState.userIsVerified,
      loggedIn: !store.state.userState.isLoggedOut,
      loggedInToVegi: store.state.userState.isLoggedInToVegi,
      hasLoggedInBefore: store.state.userState.hasLoggedInBefore,
      surveyCompleted: store.state.userState.surveyCompleted,
      isSuperAdmin: store.state.userState.isVegiSuperAdmin,
      phoneNumberNoCountry: store.state.userState.phoneNumberNoCountry,
      phoneNumber: store.state.userState.phoneNumber,
      countryCode: store.state.userState.isoCode, // the country code (IT,AF..)
      dialCode: store.state.userState.countryCode, // the dial code (+39,+93..)
      firebaseSessionToken: store.state.userState.firebaseSessionToken,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      setPhoneNumber: ({
        required CountryCode countryCode,
        required PhoneNumber phoneNumber,
      }) {
        store.dispatch(
          SetPhoneNumberSuccess(
            countryCode: countryCode,
            phoneNumber: phoneNumber,
          ),
        );
      },
      signup: ({
        required CountryCode countryCode,
        required PhoneNumber phoneNumber,
        required Future<void> Function() onSuccess,
        required Future<void> Function(dynamic) onError,
      }) {
        store.dispatch(
          loginHandler(
            countryCode,
            phoneNumber,
            onError,
            onSuccess,
          ),
        );
      },
      setUserIsLoggedOut: () {
        store.dispatch(SetVegiSessionExpired());
      },
    );
  }

  final String walletAddress;
  final bool userIsVerified;
  final bool loggedIn;
  final bool loggedInToVegi;
  final bool hasLoggedInBefore;
  final bool surveyCompleted;
  final String countryCode;
  final String dialCode;
  final String phoneNumber;
  final bool isSuperAdmin;
  final String phoneNumberNoCountry;
  final String? firebaseSessionToken;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final void Function({
    required CountryCode countryCode,
    required PhoneNumber phoneNumber,
  }) setPhoneNumber;
  final void Function({
    required CountryCode countryCode,
    required PhoneNumber phoneNumber,
    required Future<void> Function() onSuccess,
    required Future<void> Function(dynamic) onError,
  }) signup;
  final void Function() setUserIsLoggedOut;

  bool get isReauthenticationRequest =>
      firebaseAuthenticationStatus !=
      FirebaseAuthenticationStatus.unauthenticated;

  @override
  List<Object> get props => [
        walletAddress,
        userIsVerified,
        loggedIn,
        loggedInToVegi,
        hasLoggedInBefore,
        surveyCompleted,
        isSuperAdmin,
        phoneNumber,
        phoneNumberNoCountry,
        firebaseSessionToken ?? '',
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
        dialCode,
        countryCode,
      ];
}
