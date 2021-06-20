import 'package:pandemicweb/core/services/admin_api_service.dart';

class LoginRepository {
  AdminApiService _adminApiService = AdminApiService();

  Future<String> authenticate(username, password) async {
    final data = await _adminApiService.authenticate(username, password);

    if (data.containsKey("success") && data['success'] == true) {
      return data['result']['token'];
    }

    return null;
  }
}
