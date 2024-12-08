const getUsersQuery = r'''
query GetUsers($page: Int!) {
  data: users(page: $page) {
    id
    email
    first_name
    last_name
    avatar
  }
}
''';

const getSingleUserQuery = r'''
query GetSingleUser($id: ID!) {
  data: user(id: $id) {
    id
    email
    first_name
    last_name
    avatar
  }
}
''';