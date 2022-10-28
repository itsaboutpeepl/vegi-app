import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    this.onTap,
    required this.menuIcon,
    required this.label,
    this.trailing,
  }) : super(key: key);
  final void Function()? onTap;
  final String? menuIcon;
  final String label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      onTap: onTap,
      title: Row(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/$menuIcon',
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
      trailing: trailing ??
          const Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
    );
  }
}
