import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class ProfileViewModel extends Equatable {
  const ProfileViewModel({
    required this.phone,
    required this.walletAddress,
    required this.displayName,
    required this.seedPhrase,
    required this.editAvatar,
    required this.avatarUrl,
    required this.updateDisplayName,
    required this.useLocationServices,
    required this.refreshVendors,
    required this.useLiveLocation,
    required this.isLoggedIn,
    required this.isVerified,
  });

  factory ProfileViewModel.fromStore(Store<AppState> store) {
    return ProfileViewModel(
      displayName: store.state.userState.displayName,
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
      }) {
        store.dispatch(updateUserAvatarCall(
          source,
          progressCallback: progressCallback,
          onSuccess: onSuccess,
        ));
      },
      updateDisplayName: (displayName) {
        store.dispatch(updateDisplayNameCall(displayName));
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
  final String walletAddress;
  final String avatarUrl;
  final String displayName;
  final bool useLiveLocation;
  final bool isLoggedIn;
  final bool isVerified;
  final List<String> seedPhrase;
  final void Function(String displayName) updateDisplayName;
  final void Function(bool enabled) useLocationServices;
  final void Function() refreshVendors;
  final void Function(
    ImageSource source, {
    required ProgressCallback progressCallback,
    required void Function() onSuccess,
  }) editAvatar;

  @override
  List<Object> get props => [
        walletAddress,
        phone,
        displayName,
        avatarUrl,
        useLiveLocation,
        isLoggedIn,
      ];
}
