import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/home/widgets/balance.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/redux/viewsmodels/account.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountViewModel>(
      distinct: true,
      converter: AccountViewModel.fromStore,
      builder: (_, viewModel) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: Text(
                  '${I10n.of(context).hi} ${viewModel.displayName}',
                  style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Balance(),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
