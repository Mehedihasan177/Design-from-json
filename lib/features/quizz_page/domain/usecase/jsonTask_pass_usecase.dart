import 'package:codeware_task/features/quizz_page/domain/usecase/jsonTask_usecase.dart';


import '../../../../core/data/model/api_response.dart';
import '../../data/models/jsonTask_model.dart';

class JsonTaskPassUseCase extends JsonTaskUseCase {
  JsonTaskPassUseCase(super.jsonTaskRepository);

  Future<Response<List<AndroidVerison>?>?> call({required String outputType}) async {
    return await jsonTaskRepository.fetchDataPass(outputType: outputType);
  }
}
