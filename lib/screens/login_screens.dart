import 'package:chat_app/methods/auth_methods.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  void login(BuildContext context) async {
    final authservice = AuthMethods();
    try {
      await authservice.signin(_emailcontroller.text, _passwordcontroller.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 70,
                color: Color.fromARGB(255, 74, 73, 73),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Welcome back,you have been missed!',
            style: TextStyle(
              color: Color.fromARGB(255, 81, 79, 79),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 202, 193, 193),
            ),
            child: TextFormField(
              controller: _emailcontroller,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 202, 193, 193),
            ),
            child: TextFormField(
              obscureText: true,
              controller: _passwordcontroller,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => login(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 225, 223, 223),
              ),
              height: 40,
              width: 350,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 81, 79, 79),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Not a member?',
                style: TextStyle(
                  color: Color.fromARGB(255, 81, 79, 79),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
                child: const Text(
                  'Register now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 81, 79, 79),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
