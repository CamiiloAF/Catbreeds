import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:michis/features/breeds/domain/entities/bred_image.dart';
import 'package:michis/features/breeds/domain/entities/breed.dart';
import 'package:michis/features/breeds/presentation/manager/breeds_provider.dart';

class BreedItem extends StatelessWidget {
  const BreedItem({Key? key, required this.breed}) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: Colors.black38, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(breed.name),
                TextButton(
                  onPressed: () {},
                  child: const Text('Más...'),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * .3,
              width: double.infinity,
              child: breed.imageUrl != null
                  ? _buildImage(breed.imageUrl!)
                  : Consumer(builder: (_, ref, __) {
                      final breedRiverpod = ref.read(breedProvider);

                      if (breed.referenceImageId == null) {
                        return const Offstage(); //TODO SET DEFAULT IMAGE
                      }

                      return FutureBuilder<BreedImage>(
                          future: breedRiverpod.getBreedImage(
                            breed.referenceImageId!,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            breed.imageUrl = snapshot.data?.url;

                            return snapshot.hasData
                                ? _buildImage(snapshot.data!.url)
                                : const Offstage();
                          });
                    }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(breed.origin),
                  Text('Inteligencia: ${breed.intelligence}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Image _buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
      );
}
