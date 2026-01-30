import 'package:berth_api/api.dart' as berth_api;

extension UserInfoExtensions on berth_api.UserInfo {
  bool hasRole(String roleName) {
    return roles.any((role) => role.name == roleName);
  }

  bool get isAdmin => roles.any((role) => role.isAdmin);
}
