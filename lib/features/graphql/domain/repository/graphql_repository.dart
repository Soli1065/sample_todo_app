
import '../../data/services/graphql_service.dart';
import '../models/user.dart';

class GraphQLRepository {
  final GraphQLService _service;

  GraphQLRepository(this._service);

  Future<List<User>> fetchUsers({required int page, required int limit}) {
    return _service.fetchUsers(page, limit);
  }
}