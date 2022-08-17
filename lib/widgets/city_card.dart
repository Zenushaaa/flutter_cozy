import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';

import '../models/city.dart';

class Citycard extends StatelessWidget {
  final City city;
  const Citycard(this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xFFF6F7F8),
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                city.imageurl!,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              city.isPoppular!
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Icon_star.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          const SizedBox(height: 11),
          Text(
            city.nameCity!,
            style: titleTextStyle.copyWith(fontSize: 16),
          )
        ]),
      ),
    );
  }
}
