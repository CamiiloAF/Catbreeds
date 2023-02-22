import 'package:michis/features/breeds/domain/entities/bred_image.dart';

import '../entities/breed.dart';

abstract class BreedsRepositoryContract {
  Future<List<Breed>> getBreeds();
  Future<BreedImage> getBreedImage(String referencedImageId);
}
