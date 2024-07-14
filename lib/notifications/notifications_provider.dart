import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/repos/authentication_repo.dart';

class NotificationsProvider extends FamilyAsyncNotifier<void, BuildContext> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> updateToken(String token) async {
    final user = ref.read(authRepo).user;
    if (user != null) {
      await _db.collection("users").doc(user.uid).update({"token": token});
    }
  }

  Future<void> initListeners(BuildContext context) async {
    try {
      final permission = await _messaging.requestPermission();
      if (permission.authorizationStatus == AuthorizationStatus.denied) {
        return;
      }

      // Foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        print("I just got a message and I'm in the foreground");
        print(event.notification?.title);
      });

      // Background
      FirebaseMessaging.onMessageOpenedApp.listen((notification) {
        // context.pushNamed(ChatsScreen.routeName);
      });

      // Terminated
      final notification = await _messaging.getInitialMessage();
      if (notification != null) {
        // context.pushNamed(VideoRecordingScreen.routeName);
      }
    } catch (e, stackTrace) {
      print('Error initializing listeners: $e');
      print(stackTrace);
    }
  }

  @override
  Future<void> build(BuildContext context) async {
    try {
      final token = await _messaging.getToken();
      if (token == null) return;
      await updateToken(token);
      await initListeners(context);
      _messaging.onTokenRefresh.listen((newToken) async {
        await updateToken(newToken);
      });
    } catch (e, stackTrace) {
      print('Error in build: $e');
      print(stackTrace);
    }
  }
}

final notificationsProvider = AsyncNotifierProvider.family(
  () => NotificationsProvider(),
);
