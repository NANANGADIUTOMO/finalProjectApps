import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../authentication/registerAuthentication.dart';
import 'package:go_router/go_router.dart';

TextEditingController _insertName = TextEditingController();
TextEditingController _insertEmail = TextEditingController();
TextEditingController _insertPassword = TextEditingController();
TextEditingController _insertDate = TextEditingController();

bool showPassword = true;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
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
                                  "Register Account Aplikasi sister Computer",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 310,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Please Create Account"),
                                      SizedBox(height: 15),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: TextField(
                                          controller: _insertName,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            labelText: 'User Name ',
                                            prefixIcon: const Icon(
                                                Icons.account_circle_outlined,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: TextField(
                                          // obscureText: true,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _insertEmail,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            labelText: 'User Email',
                                            prefixIcon: const Icon(Icons.key,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: TextField(
                                              controller: _insertPassword,
                                              obscureText: showPassword,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  labelText: 'User Password ',
                                                  prefixIcon: const Icon(
                                                      Icons.mail,
                                                      color: Colors.black),
                                                  suffixIcon: InkWell(
                                                    child: Icon(showPassword
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onTap: () {
                                                      if (showPassword) {
                                                        setState(() {
                                                          showPassword = false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          showPassword = true;
                                                        });
                                                      }
                                                    },
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                          ),
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
                                              onPressed: () {
                                                context.go('/login');
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                          TextButton(
                                              onPressed: () async {
                                                User? user = await RegisterUser
                                                    .registerUser(
                                                        name: _insertName.text,
                                                        email:
                                                            _insertEmail.text,
                                                        password:
                                                            _insertPassword
                                                                .text,
                                                        date: _insertDate.text,
                                                        context: context);
                                                print(user);
                                                if (user != null) {
                                                  print("masuk");
                                                  context.go('/login');
                                                }
                                                ;
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
        //
      ),
    );
  }
}
