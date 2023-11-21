

import '../../../../core/data/model/api_response.dart';
import '../../data/models/jsonTask_model.dart';
import 'jsonTask_usecase.dart';

class JsonTaskPassUseCase extends JsonTaskUseCase {
  JsonTaskPassUseCase(super.jsonTaskRepository);

  Future<Response<List<AndroidVerison>?>?> call({required String outputType}) async {
    return await jsonTaskRepository.fetchDataPass(outputType: outputType);
  }
}
