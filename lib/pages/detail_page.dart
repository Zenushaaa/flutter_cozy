import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:flutter_cozy/pages/error_page.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/facilities_item.dart';
import 'package:flutter_cozy/widgets/photo_card.dart';
import 'package:flutter_cozy/widgets/rating_item.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space spaces;

  DetailPage(this.spaces, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isWishlist = false;

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

    Future<void> confirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to contact the landlord?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _launchUrl('tel:+${widget.spaces.phoneNumber}');
              },
              child: const Text('Call'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.spaces.imageUrl!,
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
                                widget.spaces.name!,
                                style: titleTextStyle.copyWith(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\$${widget.spaces.price}',
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
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  left: 2,
                                ),
                                child: RatingItem(
                                    index: index,
                                    rating: widget.spaces.rating!),
                              );
                            }).toList(),
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
                        children: [
                          FacilitiesItem(
                            imageUrl: 'assets/images/001-bar-counter.png',
                            nameFacilities: 'Kitchen',
                            numberFacilities: widget.spaces.numberKitchen,
                          ),
                          FacilitiesItem(
                            imageUrl: 'assets/images/002-double-bed.png',
                            nameFacilities: 'Bedroom',
                            numberFacilities: widget.spaces.numberBedroom,
                          ),
                          FacilitiesItem(
                            imageUrl: 'assets/images/003-cupboard.png',
                            nameFacilities: 'Big Lemari',
                            numberFacilities: widget.spaces.numberCupboards,
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
                          children: widget.spaces.photos!.map((item) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 24,
                              ),
                              child: PhotosCard(
                                imageUrl: item,
                              ),
                            );
                          }).toList()),
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
                            '${widget.spaces.address}\n${widget.spaces.city}',
                            style: subtitleTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () => _launchUrl('${widget.spaces.mapUrl}'),
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
                        onPressed: () => confirmation(),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      isWishlist = !isWishlist;
                    });
                  },
                  child: Image.asset(
                    isWishlist
                        ? 'assets/images/btn_wishlist_klik.png'
                        : 'assets/images/btn_wishlist.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
