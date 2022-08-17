import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/space.dart';

import '../theme.dart';

class SpacesCard extends StatelessWidget {
  final Space space;
  const SpacesCard(this.space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 130,
            height: 110,
            color: Colors.amber,
            child: Stack(
              children: [
                Image.asset(
                  space.imageUrl!,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Icon_star.png',
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${space.rating!}/5',
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space.name!,
              style: titleTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 2,
            ),
            Text.rich(
              TextSpan(
                text: '\$${space.price!}',
                style: numberTextStyle.copyWith(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: ' / month',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '${space.city!}, ${space.country!}',
              style: subtitleTextStyle.copyWith(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
