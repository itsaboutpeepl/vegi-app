import 'dart:core';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class LanguageSelectorViewModel {
  final Function(Locale) updateLocale;
  LanguageSelectorViewModel({
    required this.updateLocale,
  });

  static LanguageSelectorViewModel fromStore(Store<AppState> store) {
    return LanguageSelectorViewModel(
      updateLocale: (Locale locale) {
        store.dispatch(UpdateLocale(locale: locale));
      },
    );
  }
}
