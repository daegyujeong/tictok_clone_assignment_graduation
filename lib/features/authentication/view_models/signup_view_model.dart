import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/repos/authentication_repo.dart';
import 'package:tictok_clone_assignment_graduation/features/users/view_models/users_view_model.dart';
import 'package:tictok_clone_assignment_graduation/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<bool> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    // final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _repository.emailSignUp(
        email,
        password,
      );
      // await users.createProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
      return false;
    } else {
      context.go("/");
      return true;
    }
  }
}

// final signUpForm = StateProvider((ref) => {});
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
