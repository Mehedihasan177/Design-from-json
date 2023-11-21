import 'package:get_it/get_it.dart';
import '../../features/quizz_page/data/repository/jsonTask_repository_implement.dart';
import '../../features/quizz_page/data/services/jsonTask_fetch_services.dart';
import '../../features/quizz_page/domain/repository/jsonTask_repository.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<FetchDataServices>(() => FetchDataServices());
  locator.registerFactory<JsonTaskRepository>(() => JsonTaskImplement(locator()));
}
