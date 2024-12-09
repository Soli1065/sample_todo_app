import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user.dart';
import '../../data/rest_service.dart';
import '../../domain/rest_repository.dart';

final restRepositoryProvider = Provider((ref) => RestRepository(ref.watch(restServiceProvider)));

final restProvider = StateNotifierProvider<RestNotifier, AsyncValue<List<User>>>((ref) {

  final restNotifier =  RestNotifier(ref.read(restRepositoryProvider));
  restNotifier.fetchUsers();
  return restNotifier;
});

class RestNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final RestRepository _restRepository;

  RestNotifier(this._restRepository) : super(const AsyncValue.loading());


  Future<void> fetchUsers() async {
    try {
      final users = await _restRepository.fetchUsers();
      state = AsyncValue.data(users ?? []);
    } catch (e,m) {
      state = AsyncValue.error(e,m);
    }
  }

  Future<void> addUser(Map<String, dynamic> data) async {
    try {
      final user = await _restRepository.addUser(data);
    } catch (e,m) {
      state = AsyncValue.error(e,m);
    }
  }

  Future<void> editUser(int id, Map<String, dynamic> data) async {
    try {
      final user = await _restRepository.editUser(id, data);
    } catch (e,m) {
      state = AsyncValue.error(e,m);
    }
  }

  Future<void> removeUser(int id) async {
    try {
      await _restRepository.removeUser(id);
    } catch (e,m) {
      state = AsyncValue.error(e,m);
    }
  }
}