import '../../../../core/data/model/api_response.dart';

import '../../data/models/jsonTask_model.dart';
import '../../data/services/jsonTask_fetch_services.dart';

abstract class JsonTaskRepository {
  final FetchDataServices fetchDataServices;

  JsonTaskRepository(this.fetchDataServices);

  Future<Response<List<AndroidVerison>?>?> fetchDataPass({required String outputType});
}
