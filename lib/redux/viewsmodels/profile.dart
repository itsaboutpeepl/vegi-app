import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class ProfileViewModel extends Equatable {
  const ProfileViewModel({
    required this.phone,
    required this.walletAddress,
    required this.displayName,
    required this.email,
    required this.biometricAuthType,
    required this.firebaseCredentialIsValid,
    required this.firebaseAuthenticationStatus,
    required this.fuseAuthenticationStatus,
    required this.vegiAuthenticationStatus,
    required this.isSuperAdmin,
    required this.seedPhrase,
    required this.editAvatar,
    required this.avatarUrl,
    required this.updateDisplayName,
    required this.updateUserEmail,
    required this.useLocationServices,
    required this.refreshVendors,
    required this.useLiveLocation,
    required this.isLoggedIn,
    required this.isVerified,
  });

  factory ProfileViewModel.fromStore(Store<AppState> store) {
    return ProfileViewModel(
      displayName: store.state.userState.displayName,
      email: store.state.userState.email,
      biometricAuthType: store.state.userState.authType,
      firebaseCredentialIsValid:
          store.state.userState.firebaseCredentialIsValid,
      firebaseAuthenticationStatus:
          store.state.userState.firebaseAuthenticationStatus,
      fuseAuthenticationStatus: store.state.userState.fuseAuthenticationStatus,
      vegiAuthenticationStatus: store.state.userState.vegiAuthenticationStatus,
      isSuperAdmin: store.state.userState.isVegiSuperAdmin,
      useLiveLocation: store.state.userState.useLiveLocation,
      isLoggedIn: !store.state.userState.isLoggedOut,
      phone: store.state.userState.phoneNumber,
      avatarUrl: store.state.userState.avatarUrl,
      seedPhrase: store.state.userState.mnemonic,
      walletAddress: store.state.userState.walletAddress,
      isVerified: store.state.userState.userIsVerified,
      editAvatar: (
        source, {
        required ProgressCallback progressCallback,
        required void Function() onSuccess,
        void Function(String errStr)? onError,
      }) {
        store.dispatch(
          updateUserAvatarCall(
            source,
            progressCallback: progressCallback,
            onSuccess: onSuccess,
            onError: onError,
          ),
        );
      },
      updateDisplayName: (displayName) {
        store.dispatch(updateDisplayNameCall(displayName));
      },
      updateUserEmail: (email, onError) {
        store.dispatch(
          updateEmail(
            email: email,
            onError: onError,
          ),
        );
      },
      useLocationServices: (bool enabled) {
        store.dispatch(EnableLocationServices(enabled: enabled));
      },
      refreshVendors: () {
        store.dispatch(
          store.state.userState.useLiveLocation
              ? fetchFeaturedRestaurantsByUserLocation()
              : fetchFeaturedRestaurantsByPostCode(),
        );
      },
    );
  }

  final String phone;
  final String email;
  final BiometricAuth biometricAuthType;
  final FirebaseAuthenticationStatus firebaseAuthenticationStatus;
  final FuseAuthenticationStatus fuseAuthenticationStatus;
  final VegiAuthenticationStatus vegiAuthenticationStatus;
  final bool firebaseCredentialIsValid;
  final bool isSuperAdmin;
  final String walletAddress;
  final String avatarUrl;
  final String displayName;
  final bool useLiveLocation;
  final bool isLoggedIn;
  final bool isVerified;
  final List<String> seedPhrase;
  final void Function(String displayName) updateDisplayName;
  final void Function(
    String email,
    void Function(String) onError,
  ) updateUserEmail;
  final void Function(bool enabled) useLocationServices;
  final void Function() refreshVendors;
  final void Function(
    ImageSource source, {
    required ProgressCallback progressCallback,
    required void Function() onSuccess,
    void Function(String errStr)? onError,
  }) editAvatar;

  @override
  List<Object> get props => [
        walletAddress,
        phone,
        email,
        biometricAuthType,
        firebaseCredentialIsValid,
        firebaseAuthenticationStatus,
        vegiAuthenticationStatus,
        fuseAuthenticationStatus,
        isSuperAdmin,
        displayName,
        avatarUrl,
        useLiveLocation,
        isLoggedIn,
      ];
}
