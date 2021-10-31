part of 'extensions.dart';

extension FirebaseUserExtenstion on auth.User {
  User convertToUser({String email = 'no name'}) => User(email: email);
}
