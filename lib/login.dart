import 'package:flutter/material.dart';
import 'package:qualiferika/home.dart';
import 'package:qualiferika/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorUsernamevalue = '';
  String errorPasswordvalue = '';

  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  void _onPressedLogin(BuildContext context) async {
    String username = ctrlUsername.text;

    if (username.length > 5) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return HomePage(username: username);
        },
      ), (route) => false);
    }
  }

  void _onPressedRegister(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const Register();
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3D8361),
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/icons/main-logo.png',
                height: 250,
                width: 250,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: TextFormField(
                    controller: ctrlUsername,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter Username',
                        errorText: errorUsernamevalue.isEmpty
                            ? null
                            : errorUsernamevalue),
                    onChanged: (value) {
                      setState(() {
                        if (value.length < 5) {
                          errorUsernamevalue =
                              "Username must be more than 5 characters";
                        } else if (value.length > 5) {
                        } else {
                          errorUsernamevalue = '';
                        }
                      });
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: TextField(
                    controller: ctrlPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        errorText: errorPasswordvalue.isEmpty
                            ? null
                            : errorPasswordvalue),
                    onChanged: (value) {
                      setState(() {
                        if (value.length < 3) {
                          errorPasswordvalue =
                              "Password mut be more than 3 characters";
                        } else {
                          errorPasswordvalue = '';
                        }
                      });
                    }),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3D8361),
                      minimumSize: const Size(320, 45),
                    ),
                    child: const Text('Login'),
                    onPressed: () => _onPressedLogin(context),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextButton(
                  onPressed: () => _onPressedRegister(context),
                  child: const Text(
                    'Didn\'t have an account, register here!',
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
      ),
    );
  }
}
