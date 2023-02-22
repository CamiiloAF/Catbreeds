import 'package:network_bound_resource/network_bound_resource.dart';

import '../../../core/di/dependency_injector.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/http/data/config/remote_api_constants.dart';
import '../data/repository/breeds_repository.dart';
import '../domain/repository/breeds_repository_contract.dart';
import '../domain/use_cases/get_breed_image_use_case.dart';
import '../domain/use_cases/get_breeds_use_case.dart';

class BreedsDI implements DependencyInjector {
  @override
  void initializeDependencies() {
    DIManager.getIt.registerSingleton<BreedsRepositoryContract>(
      BreedsRepository(
        httpClient: DIManager.getIt<NetworkBoundResource>(),
        breedsPath: RemoteApiConstants.breedsRoute,
        breedImagesPath: RemoteApiConstants.breedImageRoute,
      ),
    );

    DIManager.getIt.registerSingleton(
      GetBreedsUseCase(DIManager.getIt<BreedsRepositoryContract>()),
    );

    DIManager.getIt.registerSingleton(
      GetBreedImageUseCase(DIManager.getIt<BreedsRepositoryContract>()),
    );
  }
}
