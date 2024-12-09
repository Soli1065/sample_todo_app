import '../data/models/user.dart';
import '../data/rest_service.dart';

class RestRepository {
  final RestService _restService;

  RestRepository(this._restService);

  Future<List<User>?> fetchUsers() => _restService.getUsers(1);

  Future<User?> fetchUserById(int id) => _restService.getUserById(id);

  Future<User?> addUser(Map<String, dynamic> data) => _restService.createUser(data);

  Future<User?> editUser(int id, Map<String, dynamic> data) => _restService.updateUser(id, data);

  Future<void> removeUser(int id) => _restService.deleteUser(id);
}