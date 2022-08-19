import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/models/tips.dart';
import 'package:flutter_cozy/providers/space_provider.dart';
import 'package:flutter_cozy/widgets/bottom_navbar.dart';
import 'package:flutter_cozy/widgets/city_card.dart';
import 'package:flutter_cozy/widgets/space_card.dart';
import 'package:flutter_cozy/widgets/tips_card.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spaceProvider = Provider.of<SpaceProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
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
                      id: 2,
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
                        id: 3,
                        nameCity: 'Surabaya',
                        imageurl: 'assets/images/image 9.png'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Citycard(
                    City(
                        id: 4,
                        nameCity: 'Palembang',
                        imageurl: 'assets/images/image 23.png'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Citycard(
                    City(
                      id: 5,
                      nameCity: 'Aceh',
                      imageurl: 'assets/images/image 24.png',
                      isPoppular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Citycard(
                    City(
                        id: 6,
                        nameCity: 'Bogor',
                        imageurl: 'assets/images/image 25.png'),
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
            // Recomended spaces
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
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data as List<Space>;
                      // ignore: unused_local_variable
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpacesCard(item),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            // Tips & Guidance
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Tips & Guidance',
                style: sectionTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/images/icon.png',
                      updatedAt: '20 April')),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/images/icon (1).png',
                      updatedAt: '11 December')),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
        floatingActionButton: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - 48,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F7F8),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_home_solid.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_mail_solid.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_card_solid.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/Icon_love_solid.png',
                isActive: false,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
