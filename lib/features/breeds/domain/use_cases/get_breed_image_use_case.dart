import 'package:michis/features/breeds/domain/entities/bred_image.dart';

import '../../../../core/use_case/use_case.dart';
import '../repository/breeds_repository_contract.dart';

class GetBreedImageUseCase implements UseCase<Future<BreedImage>, String> {
  GetBreedImageUseCase(this._repository);

  final BreedsRepositoryContract _repository;

  @override
  Future<BreedImage> call(String referencedImageId) async {
    return _repository.getBreedImage(referencedImageId);
  }
}
