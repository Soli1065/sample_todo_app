
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/rest_provider.dart';


class RestScreen extends ConsumerStatefulWidget {

  const RestScreen({super.key});

  @override
  ConsumerState<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends ConsumerState<RestScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final restState = ref.watch(restProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("REST API Example")),
      body: restState.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ref.read(restProvider.notifier).removeUser(user.id),
              ),
              onTap: () {
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(restProvider.notifier).addUser({
          //   'first_name': 'Soli',
          //   'last_name': 'Ho',
          //   'email': 'So.ho@example.com'
          // });

          ref.refresh(restProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
