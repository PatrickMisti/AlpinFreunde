
import 'package:alpin_frontend/model/user.dart';

/// mock data's for testing
class MockData {
  static User get MOCK_USER =>
      User(email: 'test@gmail.com',
          password: 'asdf1234',
          firstName: 'Max',
          lastName: 'Mustermann',
          userName: 'testUser',
          emailPush: true,
          push: false);

}