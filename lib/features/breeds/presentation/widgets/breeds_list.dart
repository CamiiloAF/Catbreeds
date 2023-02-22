import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:michis/features/breeds/presentation/widgets/breed_search_input.dart';

import '../../domain/entities/breed.dart';
import 'breed_item.dart';

class BreedsList extends ConsumerWidget {
  const BreedsList({Key? key, required this.breeds}) : super(key: key);

  final List<Breed> breeds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const BreedSearchInput(),
        ),
        breeds.isEmpty
            ? const Center(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    child: Center(
                      child: Text('No se encontraron resultados'),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemCount: breeds.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.transparent),
                  itemBuilder: (context, index) {
                    final breed = breeds[index];

                    return BreedItem(breed: breed);
                  },
                ),
              ),
      ],
    );
  }
}
