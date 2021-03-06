import 'package:vegan_liverpool/features/home/widgets/token_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/assets.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TokensListViewModel>(
      distinct: true,
      converter: TokensListViewModel.fromStore,
      builder: (_, viewModel) {
        return RefreshIndicator(
          onRefresh: () async {
            viewModel.refreshFeed();
            await Future.delayed(Duration(milliseconds: 1000));
            return;
          },
          child: ListView.separated(
            itemCount: viewModel.tokens.length,
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Divider(
                thickness: 1,
                height: 0,
              ),
            ),
            itemBuilder: (context, index) => TokenTile(
              token: viewModel.tokens[index],
            ),
          ),
        );
      },
    );
  }
}
