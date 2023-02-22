import 'package:network_bound_resource/network_bound_resource.dart';

import '../../../core/di/di_manager.dart';
import '../../di/dependency_injector.dart';
import '../data/config/remote_api_constants.dart';
import '../data/http_proxy_impl.dart';

class HttpDI implements DependencyInjector {
  @override
  void initializeDependencies() {
    DIManager.getIt.registerSingleton<NetworkBoundResource>(
      HttpProxyImpl(RemoteApiConstants.baseUrl).instance(),
    );
  }
}
