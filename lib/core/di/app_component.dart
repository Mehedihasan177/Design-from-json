import 'package:get_it/get_it.dart';

import '../../features/json_task_pages/data/repository/jsonTask_repository_implement.dart';
import '../../features/json_task_pages/data/services/jsonTask_fetch_services.dart';
import '../../features/json_task_pages/domain/repository/jsonTask_repository.dart';


final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<FetchDataServices>(() => FetchDataServices());
  locator.registerFactory<JsonTaskRepository>(() => JsonTaskImplement(locator()));
}
