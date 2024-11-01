import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:on_track_app/core/constants/network_constants.dart';
import 'package:on_track_app/core/errors/errors.dart';
import 'package:on_track_app/core/errors/exceptions.dart';

abstract class FirebaseHelper {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _storageRef = FirebaseStorage.instance;

  static Future<UserCredential> registerAnonymousUser() async {
    final userCredential = await _firebaseAuth.signInAnonymously().timeout(
          NetworkConstants.timeoutDuration,
          onTimeout: () => NetworkConstants.callTimeOutCallback(),
        );
    return userCredential;
  }

  static Future<void> updateUser({
    String? email,
    String? displayName,
    String? password,
    String? photoUrl,
    PhoneAuthCredential? phone,
  }) async {
    void updateResult;
    if (_firebaseAuth.currentUser == null) {
      throw NoCurrentUserException();
    }
    if (email != null) {
      updateResult = await _firebaseAuth.currentUser!
          .verifyBeforeUpdateEmail(email)
          .timeout(
            NetworkConstants.timeoutDuration,
            onTimeout: () => NetworkConstants.callTimeOutCallback(),
          );
    }
    if (displayName != null) {
      updateResult = await _firebaseAuth.currentUser!
          .updateDisplayName(displayName)
          .timeout(
            NetworkConstants.timeoutDuration,
            onTimeout: () => NetworkConstants.callTimeOutCallback(),
          );
    }
    if (password != null) {
      updateResult =
          await _firebaseAuth.currentUser!.updatePassword(password).timeout(
                NetworkConstants.timeoutDuration,
                onTimeout: () => NetworkConstants.callTimeOutCallback(),
              );
    }
    if (photoUrl != null) {
      updateResult =
          await _firebaseAuth.currentUser!.updatePhotoURL(photoUrl).timeout(
                NetworkConstants.timeoutDuration,
                onTimeout: () => NetworkConstants.callTimeOutCallback(),
              );
    }
    if (phone != null) {
      updateResult =
          await _firebaseAuth.currentUser!.updatePhoneNumber(phone).timeout(
                NetworkConstants.timeoutDuration,
                onTimeout: () => NetworkConstants.callTimeOutCallback(),
              );
    }
    return updateResult;
  }

  static Future<UserCredential> registerUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .timeout(
          NetworkConstants.timeoutDuration,
          onTimeout: () => NetworkConstants.callTimeOutCallback(),
        );
    return userCredential;
  }

  static Future<UserCredential> signInUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .timeout(
          NetworkConstants.timeoutDuration,
          onTimeout: () => NetworkConstants.callTimeOutCallback(),
        );
    return userCredential;
  }

  static Future<UserCredential> convertAnonymousUserToPermanent(
      {required AuthCredential credential}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.isAnonymous) {
      final userCredential = await user.linkWithCredential(credential).timeout(
            NetworkConstants.timeoutDuration,
            onTimeout: () => NetworkConstants.callTimeOutCallback(),
          );
      return userCredential;
    } else if (user == null) {
      throw FirebaseException(
          plugin: AppErrors.noUserMessage, code: AppErrors.noUserMessage);
    } else if (!user.isAnonymous) {
      throw FirebaseException(
          plugin: AppErrors.userPermanentMessage,
          code: AppErrors.userPermanentMessage);
    } else {
      throw FirebaseException(
          plugin: AppErrors.unknownErrorMessage,
          code: AppErrors.unknownErrorMessage);
    }
  }

  static Future<AuthCredential> fetchGoogleCredential() async {
    final googleInstance = GoogleSignIn();
    final GoogleSignInAccount? googleUser =
        await googleInstance.signIn().timeout(
              NetworkConstants.timeoutDuration,
              onTimeout: () => NetworkConstants.callTimeOutCallback(),
            );

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication.timeout(
      NetworkConstants.timeoutDuration,
      onTimeout: () => NetworkConstants.callTimeOutCallback(),
    );

    final googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await googleInstance.signOut().timeout(
          NetworkConstants.timeoutDuration,
          onTimeout: () => NetworkConstants.callTimeOutCallback(),
        );
    return googleAuthCredential;
  }

  static Future<void> logout() async {
    return await _firebaseAuth.signOut().timeout(
          NetworkConstants.timeoutDuration,
          onTimeout: () => NetworkConstants.callTimeOutCallback(),
        );
  }

  static Future<String> uploadFileToFirebaseStorage({required String storagePath,required String filePath})async{
      final file=File(filePath);
      final uploadResult= await _storageRef.ref(storagePath).putFile(file);
      return await uploadResult.ref.getDownloadURL();
  }

}
