import 'package:email_validator/email_validator.dart';
import 'package:ewarungapps/mainpage/homePage.dart';
import '../authentication/emIailPasswordAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../authentication/loginAuthentication.dart';

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();

bool showPwLogin = true;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/apaaja.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Image.asset(
                              "assets/sister_komputer.png",
                              width: 110,
                              height: 110,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Welcome To Sister Computer",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _formKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 280,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Please Login"),
                                    SizedBox(height: 15),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextFormField(
                                        validator: (value) =>
                                            LoginValidator.validateEmail(
                                                email: _emailcontroller.text),
                                        controller: _emailcontroller,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          labelText: 'User Email ',
                                          prefixIcon: const Icon(Icons.mail,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextFormField(
                                        validator: (value) =>
                                            LoginValidator.validatePassword(
                                                password:
                                                    _passwordcontroller.text),
                                        obscureText: showPwLogin,
                                        controller: _passwordcontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            labelText: 'User Password',
                                            prefixIcon: const Icon(Icons.key,
                                                color: Colors.black),
                                            suffixIcon: InkWell(
                                              child: Icon(showPwLogin
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onTap: () {
                                                if (showPwLogin) {
                                                  setState(() {
                                                    showPwLogin = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    showPwLogin = true;
                                                  });
                                                }
                                              },
                                            )),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "forgot password ?",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              User? user = await AuthLogin
                                                  .loginUsingEmailPassword(
                                                      email:
                                                          _emailcontroller.text,
                                                      password:
                                                          _passwordcontroller
                                                              .text,
                                                      context: context);
                                              print(user);
                                              if (user != null) {
                                                context.go('/home');
                                                _emailcontroller.clear();
                                                _passwordcontroller.clear();
                                              }
                                              ;
                                            },
                                            child: const Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              context.goNamed('register');
                                            },
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
