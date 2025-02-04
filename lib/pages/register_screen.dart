import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/auth/auth_service.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/components/custom_icon.dart';
import 'package:todo/components/custom_textfield.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/login_screen.dart';

class RegisterPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegisterPage());
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void signup(BuildContext context) async {
    final authService = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPasword(
            _emailController.text, _passwordController.text);
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(title: Text(e.toString()))),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              title: Text("Passwords do not match"),
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 145, 218, 252),
              Color.fromARGB(255, 193, 233, 251),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 193, 235, 255),
                        spreadRadius: 3.5,
                        blurRadius: 7,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.login, size: 40),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sign up with email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Easy way of managing your todo list. Sign in and get started",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: _emailController,
                  hintText: "Email",
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: "Conform password",
                  obscureText: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: "Get Started",
                  onPressed: () => signup(context),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or sign in with",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIcon(
                      icon: FontAwesomeIcons.google,
                      color: Color.fromARGB(255, 228, 94, 85),
                    ),
                    CustomIcon(
                      icon: FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(LoginPage.route()),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
