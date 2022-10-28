import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/profile.dart';
import 'package:vegan_liverpool/utils/format.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? displayName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfileViewModel>(
      distinct: true,
      converter: ProfileViewModel.fromStore,
      onDispose: (store) {
        if (displayName != null) {
          if (store.state.userState.displayName != displayName) {
            final viewmodel = ProfileViewModel.fromStore(store);
            viewmodel.updateDisplayName(displayName!);
          }
        }
      },
      builder: (_, viewmodel) {
        return MyScaffold(
          title: I10n.of(context).account,
          body: InkWell(
            focusColor: Theme.of(context).canvasColor,
            highlightColor: Theme.of(context).canvasColor,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            child: Material(
              color: Theme.of(context).canvasColor,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => _showSourceImagePicker(
                                context,
                                (source) => viewmodel.editAvatar(source),
                              ),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: ColoredBox(
                                    color: Colors.grey.shade400,
                                    child: Stack(
                                      children: [
                                        if (viewmodel.avatarUrl == '')
                                          const CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/anom.png',
                                            ),
                                            radius: 40,
                                          )
                                        else
                                          Positioned.fill(
                                            child: CachedNetworkImage(
                                              width: 60,
                                              height: 60,
                                              imageUrl: viewmodel.avatarUrl,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const CircleAvatar(
                                                backgroundImage: AssetImage(
                                                  'assets/images/anom.png',
                                                ),
                                                radius: 30,
                                              ),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Image(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        Positioned.directional(
                                          textDirection: TextDirection.ltr,
                                          bottom: 0,
                                          start: 0,
                                          end: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 3,
                                            ),
                                            alignment: Alignment.center,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            child: Text(
                                              I10n.of(context).edit,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                fontSize: 9,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              viewmodel.displayName,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            I10n.of(context).name,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          initialValue: viewmodel.displayName,
                          keyboardType: TextInputType.text,
                          cursorColor: const Color(0xFFC6C6C6),
                          onChanged: (value) => displayName = value,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            fillColor: Theme.of(context).canvasColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      _buildGroup(
                        I10n.of(context).wallet_address,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Formatter.formatEthAddress(
                                viewmodel.walletAddress,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              focusColor: Theme.of(context).canvasColor,
                              highlightColor: Theme.of(context).canvasColor,
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: viewmodel.walletAddress,
                                  ),
                                );
                                showCopiedFlushbar(context);
                              },
                              child: Icon(
                                const FaIcon(FontAwesomeIcons.copy).icon,
                                size: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      _buildGroup(
                        I10n.of(context).phoneNumber,
                        Text(
                          viewmodel.phone,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Divider(),
                      _buildGroup(
                        'Seed Phrase',
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                viewmodel.seedPhrase.toString().substring(
                                      1,
                                      viewmodel.seedPhrase.toString().length -
                                          1,
                                    ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            InkWell(
                              focusColor: Theme.of(context).canvasColor,
                              highlightColor: Theme.of(context).canvasColor,
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: viewmodel.seedPhrase
                                        .toString()
                                        .substring(
                                          1,
                                          viewmodel.seedPhrase
                                                  .toString()
                                                  .length -
                                              1,
                                        ),
                                  ),
                                );
                                showCopiedFlushbar(context);
                              },
                              child: Icon(
                                const FaIcon(FontAwesomeIcons.copy).icon,
                                size: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(onPressed: () {}, label: 'Delete Account')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroup(String title, Widget rightWidget) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              rightWidget,
            ],
          ),
        ),
      );

  void _showSourceImagePicker(
    BuildContext context,
    void Function(ImageSource source) callback,
  ) =>
      showBarModalBottomSheet<Widget>(
        useRootNavigator: true,
        context: context,
        builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(I10n.of(context).camera),
                  onTap: () {
                    callback(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(I10n.of(context).gallery),
                  onTap: () {
                    callback(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
