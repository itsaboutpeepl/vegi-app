import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_number/phone_number.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/authViewModel.dart';
import 'package:vegan_liverpool/redux/actions/onboarding_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/signUpErrorDetails.dart';
import 'package:vegan_liverpool/version.dart';

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
    required this.email,
    required this.password,
    required this.firebaseSessionToken,
    required this.signupIsInFlux,
    required this.signupError,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.appUpdateNeeded,
    required this.appUpdateNextVersion,
    required this.appUpdateNotificationSeenForBuildNumber,
    required this.authenticateAll,
    required this.setPhoneNumber,
    required this.signup,
    required this.setUserIsLoggedOut,
    required this.setLoading,
    required this.signinEmailAndPassword,
    required this.signInUserUsingEmailLink,
    required this.setAppUpdateNotificationSeen,
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
      signupIsInFlux: store.state.onboardingState.signupIsInFlux,
      email: store.state.userState.email,
      password: store.state.userState.password,
      signupError: store.state.onboardingState.signupError,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      appUpdateNeeded: store.state.userState.appUpdateNeeded,
      appUpdateNextVersion: store.state.userState.appUpdateNextVersion,
      appUpdateNotificationSeenForBuildNumber:
          store.state.userState.appUpdateNotificationSeenForBuildNumber,
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
      authenticateAll: () {
        store.dispatch(
          authenticate(),
        );
      },
      signup: ({
        required CountryCode countryCode,
        required PhoneNumber phoneNumber,
      }) {
        store.dispatch(
          loginHandler(
            countryCode,
            phoneNumber,
          ),
        );
      },
      setUserIsLoggedOut: () {
        store.dispatch(SetVegiSessionExpired());
      },
      setLoading: (bool isLoading) {
        store.dispatch(
          SignupLoading(
            isLoading: isLoading,
          ),
        );
      },
      signinEmailAndPassword: ({
        required String email,
        required String password,
      }) {
        store
          ..dispatch(
            SignupLoading(
              isLoading: true,
            ),
          )
          ..dispatch(
            signinWithEmailAndPassword(
              email: email,
              password: password,
            ),
          )
          ..dispatch(
            SignupLoading(
              isLoading: false,
            ),
          );
      },
      signInUserUsingEmailLink: ({
        required String email,
      }) {
        store
          ..dispatch(
            SignupLoading(
              isLoading: true,
            ),
          )
          ..dispatch(
            signInUserBySendingEmailLink(
              email: email,
            ),
          )
          ..dispatch(
            SignupLoading(
              isLoading: false,
            ),
          );
      },
      setAppUpdateNotificationSeen: () {
        store.dispatch(updateAppNeededNotificationSeen());
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
  final String email;
  final String? password;
  final String? firebaseSessionToken;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final bool signupIsInFlux;
  final SignUpErrorDetails? signupError;
  final bool appUpdateNeeded;
  final Version? appUpdateNextVersion;
  final Version? appUpdateNotificationSeenForBuildNumber;

  final void Function({
    required CountryCode countryCode,
    required PhoneNumber phoneNumber,
  }) setPhoneNumber;
  final void Function({
    required CountryCode countryCode,
    required PhoneNumber phoneNumber,
  }) signup;
  final void Function() setUserIsLoggedOut;
  final void Function() authenticateAll;
  final void Function(bool) setLoading;
  final void Function({
    required String email,
    required String password,
  }) signinEmailAndPassword;
  final void Function({
    required String email,
  }) signInUserUsingEmailLink;
  final void Function() setAppUpdateNotificationSeen;

  bool get isReauthenticationRequest =>
      firebaseAuthenticationStatus !=
      FirebaseAuthenticationStatus.unauthenticated;

  bool get updateNotificationNeeded =>
      appUpdateNeeded &&
      appUpdateNextVersion != null &&
      appUpdateNotificationSeenForBuildNumber != null &&
      appUpdateNotificationSeenForBuildNumber! > appUpdateNextVersion!;

  @override
  List<Object?> get props => [
        walletAddress,
        userIsVerified,
        loggedIn,
        loggedInToVegi,
        hasLoggedInBefore,
        surveyCompleted,
        isSuperAdmin,
        phoneNumber,
        phoneNumberNoCountry,
        email,
        password,
        firebaseSessionToken ?? '',
        signupIsInFlux,
        signupError,
        firebaseAuthenticationStatus,
        fuseAuthenticationStatus,
        vegiAuthenticationStatus,
        appUpdateNeeded,
        appUpdateNextVersion,
        appUpdateNotificationSeenForBuildNumber,
        dialCode,
        countryCode,
      ];
}
