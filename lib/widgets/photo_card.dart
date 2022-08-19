import 'package:flutter/material.dart';

class PhotosCard extends StatelessWidget {
  final String? imageUrl;
  const PhotosCard({this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 88,
        width: 110,
        // margin: const EdgeInsets.only(left: 24),
        child: Image.network(
          imageUrl!,
          height: 88,
          width: 110,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
