import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceFirebaseToken implements AuthService {
  RestService get rest => dependency();

  Future<User> authenticate({String email, String password}) async {
    try {
      final json = await rest
          .post('auths/signin', data: {'email': email, 'password': password});

      if (json == null) return null;

      String userUrl = 'users/' + json['localId'];

      print("${userUrl}");

      // Pre-process json data to comply with the field of the User model
      json['id'] = json['localId'];
      json['name'] = json['displayName'];
      json['photoUrl'] = json['profilePicture'];

      // Get the access token and let the rest object stores that
      rest.openSession(json['idToken']);

      final _user = User.fromJson(json);
      return _user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async => rest.closeSession();
}
