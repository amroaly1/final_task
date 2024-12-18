import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:final_task/core/constant/firebase_constant.dart';
import 'package:final_task/feature/auth/sign_in/model/sign_in_model.dart';
import 'package:final_task/feature/auth/sign_up/model/sing_up_model.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:final_task/feature/home/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirebase {
  static Future<Either<String, UserCredential>> signUp(
      SingUpModel signupmodel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupmodel.email,
        password: signupmodel.password,
      );

      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //  print('The password provided is too weak.');
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        return left('The account already exists for that email.');
      } else {
        return left('Oops there was an error try again.');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  static Future<Either<String, UserCredential>> signIn(
      SignInModel siginin) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: siginin.email,
        password: siginin.password,
      );
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left('oops! email or password wrong.');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  static Future<Either<String, bool>> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return left('The email address is not valid.');
      } else if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else {
        return left('Something went wrong: ${e.message}');
      }
    } catch (e) {
      return left('An unexpected error occurred: $e');
    }
  }

  static Future<Either<String, bool>> addData(
      String pathCollection, Map<String, dynamic> data) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(pathCollection);

    try {
      await collection.add(data);
      return right(true); // Success
    } catch (onError) {
      return left("Failed to add data: ${onError.toString()}"); // Failure
    }
  }

  static Future<Either<String, UserModel>> getNameUser(String email) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .where(FirebaseConstant.usersId, isEqualTo: email)
          .get();
      var id = data.docs[0].id;
      if (data.docs.isNotEmpty) {
        var user =
            UserModel(name: data.docs[0][FirebaseConstant.usersName], id: id);
        return right(user);
      } else {
        return left('No user found with the provided email.');
      }
    } catch (e) {
      return left('An error occurred: $e');
    }
  }

  static Future<Either<String, List<DocotorModel>>> getDoctors(
      String collection) async {
    try {
      // Fetch data from the Firestore collection
      var data = await FirebaseFirestore.instance.collection(collection).get();

      // Convert Firestore documents to a list of DoctorModel
      List<DocotorModel> res = data.docs.map((element) {
        return DocotorModel(
          name: element[FirebaseConstant.name],
          phone: element[FirebaseConstant.phone],
          email: element[FirebaseConstant.email],
          location: element[FirebaseConstant.location],
          age: element[FirebaseConstant.age],
          description: element[FirebaseConstant.description],
          gender: element[FirebaseConstant.gender],
        );
      }).toList();

      // Return the list wrapped in a Right
      return right(res);
    } on FirebaseException catch (e) {
      // Handle Firebase-specific exceptions and return error message
      return left('Firebase error: ${e.message}');
    } catch (e) {
      // Handle other exceptions and return error message
      return left('An unexpected error occurred: $e');
    }
  }

  static Future<Either<String, String>> addFavorite(
      String id, Map<String, dynamic> data) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .doc(id)
          .collection(FirebaseConstant.doctorSubCollection);

      await collectionRef.add(data);

      return right("correct");
    } catch (e) {
      return left("Failed to add favorite: ${e.toString()}");
    }
  }

  static Future<Either<String, List<DocotorModel>>> getFavoriteDoctor(
      String id) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .doc(id)
          .collection(FirebaseConstant.doctorSubCollection)
          .get();

      List<DocotorModel> res = data.docs.map((element) {
        return DocotorModel(
          name: element[FirebaseConstant.name] ?? '',
          phone: element[FirebaseConstant.phone] ?? '',
          email: element[FirebaseConstant.email] ?? '',
          location: element[FirebaseConstant.location] ?? '',
          age: element[FirebaseConstant.age] ?? 0,
          description: element[FirebaseConstant.description] ?? '',
          gender: element[FirebaseConstant.gender] ?? '',
        );
      }).toList();

      return right(res);
    } catch (e) {
      return left("Failed to get favorite doctors: ${e.toString()}");
    }
  }

  static Future<Either<String, bool>> deleteFavoriteDoctor(
      String userId, DocotorModel doctor) async {
    try {
      // Query for the doctor document based on the email
      var querySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .doc(userId)
          .collection(FirebaseConstant.doctorSubCollection)
          .where(FirebaseConstant.email, isEqualTo: doctor.email)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isEmpty) {
        return left("No doctor found with the provided email.");
      }

      // Get the document ID
      String docId = querySnapshot.docs.first.id;

      // Delete the document
      await FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .doc(userId)
          .collection(FirebaseConstant.doctorSubCollection)
          .doc(docId)
          .delete();

      return right(true); // Success
    } catch (e) {
      return left("Failed to delete favorite doctor: ${e.toString()}");
    }
  }
}
