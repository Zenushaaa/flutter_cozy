import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/widgets/city_card.dart';
import 'package:flutter_cozy/widgets/space_card.dart';

import '../theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: ListView(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Explore Now',
                  style: titleTextStyle.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              // Sub-Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: subtitleTextStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Popular cities
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Popular Cities',
                  style: sectionTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    Citycard(
                      City(
                          id: 1,
                          nameCity: 'Jakarta',
                          imageurl: 'assets/images/image 10.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Citycard(
                      City(
                        id: 1,
                        nameCity: 'Bandung',
                        imageurl: 'assets/images/image 11.png',
                        isPoppular: true,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Citycard(
                      City(
                          id: 1,
                          nameCity: 'Surabaya',
                          imageurl: 'assets/images/image 9.png'),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Recommended Space',
                  style: sectionTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SpacesCard(
                      Space(
                        id: 1,
                        name: 'Kuretakeso Hott',
                        price: 52,
                        imageUrl: 'assets/images/image 14.png',
                        city: 'Bandung',
                        country: 'Indonesia',
                        rating: 4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SpacesCard(
                      Space(
                        id: 2,
                        name: 'Roemah Nenek',
                        price: 11,
                        imageUrl: 'assets/images/image 15.png',
                        city: 'Yogyakarta',
                        country: 'Indonesia',
                        rating: 5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SpacesCard(
                      Space(
                        id: 1,
                        name: 'Darrling How',
                        price: 20,
                        imageUrl: 'assets/images/image 13.png',
                        city: 'Bengklulu',
                        country: 'Indonesia',
                        rating: 3,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
