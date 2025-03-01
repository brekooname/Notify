import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify/core/network/error/exceptions.dart';
import 'package:notify/core/network/error/failures.dart';
import 'package:notify/features/auth/presentation/screens/view%20model/signup%20view%20model/signup_view_model.dart';

class FirebaseServices {
  static Future<void> saveUserData(
      String username, String firstName, String lastName, String id) async {
    try {
      // Save User data using UID
      await FirebaseFirestore.instance.collection('users').doc(id).set({
        'firstName': firstName,
        'lastName': lastName,
      });
    } catch (e) {
      throw CacheException(SignupViewModle.userDatadidnotSaved);
    }
    
    try {
      // Save User data using username
      await FirebaseFirestore.instance
          .collection('usernames')
          .doc(username)
          .set({
        'id': id,
      });
    } catch (e) {
      throw CacheException(SignupViewModle.usernameDidnotSaved);
    }
  }
  static Future<void> searchUsername(String username) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('usernames')
          .doc(username)
          .get();
      if (response.exists) {
        throw FirebaseAUthFailure(SignupViewModle.usernameAlreadyIn);
      }
    } catch (e) {
      throw FirebaseAUthFailure(SignupViewModle.usernameAlreadyIn);
    }
  }
}
