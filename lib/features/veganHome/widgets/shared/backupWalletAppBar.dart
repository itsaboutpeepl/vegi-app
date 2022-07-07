import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/saveSeedPhrase.dart';

class BackupWalletAppBar extends StatelessWidget {
  const BackupWalletAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SaveSeedPhraseViewModel>(
      converter: SaveSeedPhraseViewModel.fromStore,
      builder: (_, viewmodel) {
        return viewmodel.showBanner
            ? SliverAppBar(
                toolbarHeight: 30,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                floating: false,
                pinned: false,
                snap: false,
                centerTitle: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.01,
                flexibleSpace: FlexibleSpaceBar(
                  title: GestureDetector(
                    onTap: () => context.router.push(ShowUserMnemonic()),
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text.rich(
                            TextSpan(
                              text: "Please save your seed phrase",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: "\nYour seed phrase is used to restore access to your wallet",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      color: themeShade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: themeShade900,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                ),
              )
            : SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
      },
    );
  }
}
