import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/exceptions/failure.dart';
import '../../../shared/widgets/dialogs/alerts.dart';
import 'manager/breeds_provider.dart';
import 'widgets/breeds_list.dart';

class BreedsPage extends ConsumerStatefulWidget {
  const BreedsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends ConsumerState<BreedsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async => _loadBreeds());
    super.initState();
  }

  Future<void> _loadBreeds() async {
    try {
      await ref.read(breedProvider).getBreeds();
    } on Failure catch (e) {
      AlertUtils.showSnackBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Catbreeds'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _loadBreeds(),
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final breedsRiverpod = ref.watch(breedProvider);

            if (breedsRiverpod.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BreedsList(breeds: breedsRiverpod.breeds),
            );
          },
        ),
      ),
    );
  }
}
