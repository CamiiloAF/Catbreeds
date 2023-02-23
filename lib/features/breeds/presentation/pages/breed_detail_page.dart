import 'package:flutter/material.dart';

import '../../domain/entities/breed.dart';
import '../widgets/breed_cache_image.dart';
import '../widgets/breed_image_placeholder.dart';

class BreedDetailPage extends StatelessWidget {
  const BreedDetailPage({Key? key, required this.breed}) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * .5,
            child: breed.imageUrl != null
                ? BreedCacheImage(
                    imageUrl: breed.imageUrl!,
                    cacheKey: breed.id + breed.name,
                  )
                : const BreedImagePlaceholder(),
          ),
          Expanded(
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(breed.description, style: textTheme.subtitle1),
                    _buildSeparator(),
                    _buildTextSpan('Country', breed.origin),
                    _buildTextSpan('Intelligence', '${breed.intelligence}'),
                    _buildTextSpan('Adaptability', '${breed.adaptability}'),
                    _buildTextSpan('Vitality', breed.lifeSpan),
                    _buildSeparator(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildSeparator() => const SizedBox(height: 16);

  Widget _buildTextSpan(String title, String text) {
    return Builder(builder: (context) {
      final textTheme = Theme.of(context).textTheme;

      return RichText(
        text: TextSpan(children: [
          TextSpan(
            text: '$title: ',
            style: textTheme.subtitle1!.copyWith(color: Colors.black),
          ),
          TextSpan(text: text, style: textTheme.subtitle1!)
        ]),
      );
    });
  }
}
