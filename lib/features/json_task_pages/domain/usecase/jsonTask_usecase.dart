
import '../repository/jsonTask_repository.dart';

abstract class JsonTaskUseCase {
  final JsonTaskRepository jsonTaskRepository;

  JsonTaskUseCase(this.jsonTaskRepository);
}