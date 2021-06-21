import 'package:pandemicweb/core/models/orientation.model.dart';
import 'package:pandemicweb/core/services/admin_api_service.dart';

class OrientationRepository {
  AdminApiService _adminApiService = AdminApiService();

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


  

}
