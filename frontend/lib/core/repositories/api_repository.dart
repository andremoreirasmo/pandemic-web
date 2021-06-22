import 'package:pandemicweb/core/models/orientation.model.dart';
import 'package:pandemicweb/core/models/symptom.model.dart';
import 'package:pandemicweb/core/services/admin_api_service.dart';

class ApiRepository {
  AdminApiService _adminApiService = AdminApiService();

  Future<String> authenticate(username, password) async {
    final data = await _adminApiService.authenticate(username, password);

    if (data.containsKey("success") && data['success'] == true) {
      return data['result']['token'];
    }

    return null;
  }

  Future<String> createOrientation(title, description) async {
    final data = await _adminApiService.createOrientation(title, description);

    if (data.containsKey("success") && data['success'] == true) {
      return data['result']['id_ori'];
    }

    return null;
  }

  Future<List<Orientation>> getOrientations() async {
    List<Orientation> orientations = [];
    final data = await _adminApiService.getOrientations();

    if (data.containsKey("success") && data['success'] == true) {
      data['result'].forEach((r) => orientations.add(Orientation.fromJson(r)));
    }
    return orientations;
  }

  Future<List<SymptomModel>> getSymptoms() async {
    List<SymptomModel> sintomas = [];
    Map<String, dynamic> result = await _adminApiService.getSymptoms();

    if (result.containsKey("success") && result['success'] == true) {
      result['result'].forEach((r) => sintomas.add(SymptomModel.fromJson(r)));
    }
    return sintomas;
  }

  Future<SymptomModel> sendSymptom(String description) async {
    Map<String, dynamic> result =
        await _adminApiService.addSymptom(description);
    return SymptomModel.fromJson(result['data'] ?? {});
  }

  Future<bool> removeSymptom(String id) async {
    bool result = await _adminApiService.removeSymptom(id);

    return result ?? false;
  }
}
