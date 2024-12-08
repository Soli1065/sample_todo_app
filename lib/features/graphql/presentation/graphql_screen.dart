import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/graphql_provider.dart';

class GraphQLScreen extends ConsumerWidget {
  const GraphQLScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final usersAsyncValue = ref.watch(graphqlUserNotifierProvider);

    final graphState = ref.watch(graphqlProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('GraphQL Users')),
      body: graphState.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(graphqlUserNotifierProvider.notifier).fetchUsers(page: 1, limit: 5);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}