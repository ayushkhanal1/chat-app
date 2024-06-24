import 'package:chat_app/methods/auth_methods.dart';
import 'package:chat_app/screens/login_screens.dart';
import 'package:chat_app/utility/snackbar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    final TextEditingController _usernamecontroller = TextEditingController();
    void register(BuildContext context) async {
      final auth = AuthMethods();
      try {
        await auth.register(_emailcontroller.text, _usernamecontroller.text,
            _passwordcontroller.text);
        showsnackbar('Successfully registered!', context);
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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }

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
            'Lets create an account for you',
            style:
                TextStyle(color: Color.fromARGB(255, 81, 79, 79), fontSize: 14),
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
              controller: _usernamecontroller,
              decoration: const InputDecoration(
                  hintText: 'Username',
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
              controller: _passwordcontroller,
              obscureText: true,
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
            onTap: () => register(context),
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
                  'Register',
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
                'Already have an account?',
                style: TextStyle(
                  color: Color.fromARGB(255, 81, 79, 79),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
                child: const Text(
                  'Login now',
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
