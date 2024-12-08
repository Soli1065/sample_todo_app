import '../../domain/models/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final GraphQLClient _client;

  GraphQLService(this._client);

  Future<List<User>> fetchUsers(int page, int limit) async {
    const String query = r'''
      query GetUsers($page: Int, $limit: Int) {
        users(options: { paginate: { page: $page, limit: $limit } }) {
          data {
            id
            name
            email
          }
        }
      }
    ''';

    final result = await _client.query(
      QueryOptions(
        document: gql(query),
        variables: {
          'page': page,
          'limit': limit,
        },
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final List<dynamic> usersData = result.data?['users']['data'] ?? [];
    return usersData.map((user) => User.fromJson(user)).toList();
  }
}