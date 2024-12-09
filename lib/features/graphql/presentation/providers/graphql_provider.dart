import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../data/services/graphql_service.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/graphql_repository.dart';

class GraphQLUserNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final GraphQLRepository _repository;

  GraphQLUserNotifier(this._repository) : super(AsyncValue.loading());

  Future<void> fetchUsers({required int page, required int limit}) async {
    try {
      state = AsyncValue.loading();
      final users = await _repository.fetchUsers(page: page, limit: limit);
      state = AsyncValue.data(users);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final graphqlProvider = StateNotifierProvider<GraphQLUserNotifier, AsyncValue<List<User>>>((ref) {
  final graphNotifier =  GraphQLUserNotifier(ref.read(graphqlRepositoryProvider));
  graphNotifier.fetchUsers(page: 1, limit: 10);
  return graphNotifier;
});

final graphqlUserNotifierProvider =
StateNotifierProvider<GraphQLUserNotifier, AsyncValue<List<User>>>((ref) {
  final repository = ref.watch(graphqlRepositoryProvider);
  return GraphQLUserNotifier(repository);
});

final graphqlRepositoryProvider = Provider<GraphQLRepository>((ref) {
  final service = ref.watch(graphqlServiceProvider);
  return GraphQLRepository(service);
});

final graphqlServiceProvider = Provider<GraphQLService>((ref) {
  final client = ref.watch(graphqlClientProvider);
  return GraphQLService(client);
});

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  return GraphQLClient(
    link: HttpLink('https://graphqlzero.almansi.me/api'),
    cache: GraphQLCache(),
  );
});