import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_assignment_graduation/constants/gaps.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view/sign_up_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view_models/login_view_model.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static String routeName = "login";
  static String routeURL = "/login";
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  final List<String> emojis1 = [
    '😀',
    '😁',
    '😂',
    '🤣',
    '😃',
    '😄',
    '😅',
    '😆',
    '😉',
    '😊',
    '😋',
    '😎',
  ];

  final List<String> emojis2 = [
    '😋',
    '😍',
    '😘',
    '🥰',
    '😗',
    '😙',
    '😚',
    '🙂',
    '😀',
    '🤣',
    '😃',
    '😄',
    '😅',
  ];

  final List<String> emojis3 = [
    '🤗',
    '🤔',
    '🤨',
    '😐',
    '😑',
    '😶',
    '🙄',
    '😏',
    '😣',
    '😥',
    '🤗',
    '🤔',
  ];

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation1 = Tween<Offset>(
      begin: const Offset(0.03, 0),
      end: const Offset(-0.03, 0),
    ).animate(_controller);

    _animation2 = Tween<Offset>(
      begin: const Offset(-0.03, 0),
      end: const Offset(0.03, 0),
    ).animate(_controller);

    _animation3 = Tween<Offset>(
      begin: const Offset(0.03, 0),
      end: const Offset(-0.03, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToSignUp(BuildContext context) {
    context.go(SignUpScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = ref.watch(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: Colors.amber[100], // 배경 색상 설정
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Emojis
            Stack(
              children: [
                Column(
                  children: [
                    const Text(
                      '😀😁😂🤣😃😄😅😆😉😊😋😎😍😘',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '😀😁😂🤣😃😄😅😆😉😊😋😎😍😘',
                      style: TextStyle(fontSize: 25),
                    ),
                    SlideTransition(
                      position: _animation1,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 2.0,
                        children: emojis1
                            .map((emoji) => Text(emoji,
                                style: const TextStyle(fontSize: 25)))
                            .toList(),
                      ),
                    ),
                    SlideTransition(
                      position: _animation2,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 2.0,
                        children: emojis2
                            .map((emoji) => Text(emoji,
                                style: const TextStyle(fontSize: 25)))
                            .toList(),
                      ),
                    ),
                    SlideTransition(
                      position: _animation3,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 2.0,
                        children: emojis3
                            .map((emoji) => Text(emoji,
                                style: const TextStyle(fontSize: 25)))
                            .toList(),
                      ),
                    ),
                    const Text(
                      '😀😁😂🤣😃😄😅😆😉😊😋😎😍😘',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '😀😁😂🤣😃😄😅😆😉😊😋😎😍😘',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '😀😁😂🤣😃😄😅😆😉😊😋😎😍😘',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),

                // App Logo
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.faceSmile,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 5),
                                FaIcon(
                                  FontAwesomeIcons.faceFrown,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 5),
                                FaIcon(
                                  FontAwesomeIcons.faceAngry,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Text(
                              'Mood',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Diary',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Gaps.v20,
            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
            ),

            Gaps.v20,
            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
            ),

            Gaps.v20,
            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: loginState.isLoading
                    ? null
                    : () async {
                        await loginViewModel.login(
                          _emailController.text,
                          _passwordController.text,
                          context,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.pinkAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: loginState.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Enter'),
              ),
            ),
            if (loginState.hasError)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  loginState.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            Gaps.v20,
            // Sign Up and Forgot Password Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      _navigateToSignUp(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
            Gaps.v20,
            // Social Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon:
                      const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
