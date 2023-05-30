import 'package:flutter/material.dart';
import 'package:qualiferika/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAgree = false;

  var ctrlFullName = TextEditingController();
  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  void _onPressedLogin(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const Login();
      },
    ), (route) => false);
  }

  void _onPressedRegister(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const Login();
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: const Color(0xff3D8361),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/icons/main-logo.png',
              height: 200,
              width: 200,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextFormField(
                controller: ctrlFullName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    hintText: 'Enter Full Name'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextFormField(
                controller: ctrlUsername,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter Username'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextField(
                controller: ctrlPassword,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password'),
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: CheckboxListTile(
                  title: const Text("Agree?"),
                  secondary: const Icon(Icons.album),
                  subtitle: const Text("Agree?"),
                  value: isAgree,
                  onChanged: (value) {
                    setState(() {
                      isAgree = value!;
                    });
                  }),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3D8361),
                    minimumSize: const Size(320, 45),
                  ),
                  child: const Text('Register'),
                  onPressed: () => _onPressedLogin(context),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextButton(
                onPressed: () => _onPressedRegister(context),
                child: const Text(
                  'Already have an account, login here!',
                  style: TextStyle(
                    color: Color(0xff1C6758),
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
