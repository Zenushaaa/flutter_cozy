import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';

import '../models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  const TipsCard(this.tips, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl!,
          width: 80,
          height: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title!,
              style: titleTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updatedAt!}',
              style: subtitleTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ))
      ],
    );
  }
}
