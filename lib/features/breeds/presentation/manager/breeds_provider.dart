import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:michis/features/breeds/domain/entities/bred_image.dart';

import '../../../../core/di/di_manager.dart';
import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/breed.dart';
import '../../domain/use_cases/get_breed_image_use_case.dart';
import '../../domain/use_cases/get_breeds_use_case.dart';

final breedProvider = ChangeNotifierProvider.autoDispose(
  (_) => BreedsProvider(
    getBreedsUseCase: DIManager.getIt<GetBreedsUseCase>(),
    getBreedImageUseCase: DIManager.getIt<GetBreedImageUseCase>(),
  ),
);

class BreedsProvider extends ChangeNotifier {
  BreedsProvider(
      {required GetBreedsUseCase getBreedsUseCase,
      required GetBreedImageUseCase getBreedImageUseCase})
      : _getBreedsUseCase = getBreedsUseCase,
        _getBreedImageUseCase = getBreedImageUseCase;

  final GetBreedsUseCase _getBreedsUseCase;
  final GetBreedImageUseCase _getBreedImageUseCase;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<Breed> _breeds = [];

  List<Breed> get breeds => _breeds;

  List<Breed> _allBreeds = [];

  Future<void> getBreeds() async {
    try {
      _breeds = await _getBreedsUseCase(null);
      _allBreeds = [..._breeds];
    } on Failure {
      rethrow;
    } on Exception catch (_) {
      throw Failure();
    } finally {
      _changeLoadingState(isLoading: false);
    }
  }

  Future<BreedImage> getBreedImage(String referencedImageId) async {
    return await _getBreedImageUseCase(referencedImageId);
  }

  void _changeLoadingState({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void filterBreeds(String value) {
    _breeds = _allBreeds
        .where((bred) => bred.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
