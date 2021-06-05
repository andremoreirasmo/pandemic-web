import 'package:pandemicweb/models/admin.token.model.dart';
import 'package:pandemicweb/services/admin_api_service.dart';


class LoginRepository {
    AdminApiService _adminApiService = AdminApiService();
  

  Future<AdminToken> authenticate(username,password) async {
    final data = await _adminApiService.authenticate(username,password);

    if (data.containsKey("success") && data['success'] == true) {
      return AdminToken.fromJson(data['result']);
    }

    return AdminToken.fromJson({});
  }
}
