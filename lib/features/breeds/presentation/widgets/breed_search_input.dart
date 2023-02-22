import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:michis/features/breeds/presentation/manager/breeds_provider.dart';

class BreedSearchInput extends StatelessWidget {
  const BreedSearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final breedRiverpod = ref.read(breedProvider);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              breedRiverpod.filterBreeds(value);
            },
          ),
        );
      },
    );
  }
}
