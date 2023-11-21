import '../../../../core/di/app_component.dart';
import '../../../../core/utils/status/status.dart';
import '../../data/models/jsonTask_model.dart';
import '../../domain/repository/jsonTask_repository.dart';
import '../../domain/usecase/jsonTask_pass_usecase.dart';

class DataFetchFunction{
  static var androidVersion = [];
  static var filteredAndroidVersion = [];
  static var noDataFound = false;
  static var noDataFoundTwo = false;
   void fetchAllApplicantData({required String outputType}) async {
    final questionPassUseCase = JsonTaskPassUseCase(locator<JsonTaskRepository>());
    var response = await questionPassUseCase(outputType: outputType);
    try {
      if (response?.data != null && response!.data!.isNotEmpty) {
        var newAndroidVersions = response!.data!.expand((element) {
          if (element is Map<String, dynamic>) {
            return [AndroidVerison(id: element.id, title: element.title)];
          } else if (element is List) {
            // Handle the case if the element is a list, not needed if element is AndroidVersion
            return [AndroidVerison(id: element.id, title: element.title)];

          } else if (element is AndroidVerison) {
            // If element is already an AndroidVersion, return it as is
            return [element];
          } else {
            return [];
          }
        }).toList();

        // Assuming androidVersion is a List<AndroidVersion> defined in your class
        androidVersion.clear();
          androidVersion.addAll(newAndroidVersions);
          filteredAndroidVersion = androidVersion;
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
  List filterListById(String id) {
      if (id.isEmpty) {
        // If the input is empty, show the entire list
        filteredAndroidVersion.clear();
        filteredAndroidVersion = androidVersion;
      } else {
        // Filter the list based on the entered ID
        filteredAndroidVersion = androidVersion
            .where((item) => item.id == int.tryParse(id))
            .toList();
      }
      return filteredAndroidVersion;
  }
}