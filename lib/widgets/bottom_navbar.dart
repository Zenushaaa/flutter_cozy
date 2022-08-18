import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool? isActive;
  const BottomNavbarItem({this.imageUrl, this.isActive, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl!,
          width: 26,
          color: isActive! ? purpleColor : greyColor,
        ),
        const Spacer(),
        isActive!
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
