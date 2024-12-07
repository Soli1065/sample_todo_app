import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/graphql_service.dart';
import '../services/rest_service.dart';

final networkProvider = Provider((ref) => NetworkProvider(ref));

class NetworkProvider {
  final Ref ref;

  NetworkProvider(this.ref);

  Future<void> testNetwork() async {
    try {
      // Test REST Service
      final restService = ref.watch(restServiceProvider);
      final restResponse = await restService.get('/test-endpoint');
      print('REST Service Response: ${restResponse.data}');

      // Test GraphQL Service
      final graphqlService = ref.watch(graphqlServiceProvider);
      final graphqlResponse = await graphqlService.query('/graphql-endpoint');
      print('GraphQL Service Response: ${graphqlResponse.data}');
    } catch (e) {
      print('Error testing network services: $e');
    }
  }
}