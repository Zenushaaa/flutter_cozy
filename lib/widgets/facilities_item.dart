import 'package:flutter/material.dart';

import '../theme.dart';

class FacilitiesItem extends StatelessWidget {
  final String? nameFacilities;
  final String? imageUrl;
  final int? numberFacilities;

  const FacilitiesItem(
      {this.nameFacilities, this.numberFacilities, this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl!,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '${numberFacilities!} ',
            style: numberTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: nameFacilities,
                style: subtitleTextStyle.copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
