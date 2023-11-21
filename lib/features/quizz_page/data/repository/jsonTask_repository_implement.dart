import '../../../../core/data/model/api_response.dart';
import '../../domain/repository/jsonTask_repository.dart';
import '../models/jsonTask_model.dart';
import '../services/jsonTask_fetch_services.dart';

class JsonTaskImplement extends JsonTaskRepository {
  JsonTaskImplement(FetchDataServices fetchDataServices)
      : super(fetchDataServices);

  @override
  Future<Response<List<AndroidVerison>?>?> fetchDataPass({required String outputType}) async {
    Response<List<AndroidVerison>>? apiResponse;
      apiResponse = await fetchDataServices.fetchData(outputType: outputType);
      return apiResponse;
  }
}
