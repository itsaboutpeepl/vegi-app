import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';

class ResetApp extends StatelessWidget {
  const ResetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: ResetAppViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          ResetAppState(),
        );
        rootRouter.replaceAll([SplashScreen()]);
      },
      builder: (context, viewModel) {
        return const Placeholder();
      },
    );
  }
}

class ResetAppViewModel extends Equatable {
  const ResetAppViewModel({
    required this.refreshOrders,
  });

  factory ResetAppViewModel.fromStore(Store<AppState> store) {
    return ResetAppViewModel(
      refreshOrders: () {
        store.dispatch(
          ResetAppState(),
        );
      },
    );
  }

  final void Function() refreshOrders;

  @override
  List<Object?> get props => [];
}
