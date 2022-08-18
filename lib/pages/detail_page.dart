import 'package:flutter/material.dart';
import 'package:flutter_cozy/pages/error_page.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/facilities_item.dart';
import 'package:flutter_cozy/widgets/photo_card.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String _url) async {
      final Uri url = Uri.parse(_url);
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 350,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(23),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kuretakeso Hott',
                                style: titleTextStyle.copyWith(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\$52',
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
                            ],
                          ),
                          // NOTE : STAR
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Icon_star.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/Icon_star.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/Icon_star.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/Icon_star.png',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                'assets/images/Icon_star.png',
                                width: 20,
                                color: const Color(0xFF989BA1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: Main Facilities
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Main Facilities',
                        style: sectionTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          FacilitiesItem(
                            imageUrl: 'assets/images/001-bar-counter.png',
                            nameFacilities: 'Kitchen',
                            numberFacilities: 2,
                          ),
                          FacilitiesItem(
                            imageUrl: 'assets/images/002-double-bed.png',
                            nameFacilities: 'Bedroom',
                            numberFacilities: 3,
                          ),
                          FacilitiesItem(
                            imageUrl: 'assets/images/003-cupboard.png',
                            nameFacilities: 'Big Lemari',
                            numberFacilities: 3,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: Photos
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Photos',
                        style: sectionTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          SizedBox(
                            width: 24,
                          ),
                          PhotosCard(
                            imageUrl: 'assets/images/image 18.png',
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          PhotosCard(
                            imageUrl: 'assets/images/image 19.png',
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          PhotosCard(
                            imageUrl: 'assets/images/image 17.png',
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          PhotosCard(
                            imageUrl: 'assets/images/image 14.png',
                          ),
                          SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: Location
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Location',
                        style: sectionTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jln. Kappan Sukses No. 20\nPalembang',
                            style: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () => _launchUrl(
                                'https://goo.gl/maps/zWYnyQ9CsHYShxwH6'),
                            child: Image.asset(
                              'assets/images/btn_location.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Note: Button Book Now
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: ElevatedButton(
                        onPressed: () => _launchUrl('tel:+123123123'),
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          primary: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: Text(
                          'Book Now',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
          // Note: Button back & wishlist
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/btn_back.png',
                    width: 40,
                  ),
                ),
                Image.asset(
                  'assets/images/btn_wishlist.png',
                  width: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
