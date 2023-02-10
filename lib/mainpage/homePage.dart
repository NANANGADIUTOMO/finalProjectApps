import 'dart:html';
import 'dart:ui';

import 'package:ewarungapps/product/productPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var _primaryCollor = Colors.green.shade400;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Sister Computer Apps",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15, top: 5),
            width: 45,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                context.goNamed('login');
              },
              icon: Icon(Icons.logout),
              iconSize: 15,
              hoverColor: Colors.transparent,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 122, 235, 225)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "Hey! "
                    "${user!.displayName} "
                    "Welcome Back.. ",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Image.asset(
                      'assets/sister_komputer.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.goNamed("product");
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 122, 235, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Image.asset(
                                    "assets/mouse.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text("Product")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.goNamed("grafik");
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 122, 235, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Image.asset(
                                    "assets/garfik.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text("Grafik ")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.goNamed("riwayat");
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 122, 235, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Image.asset(
                                    "assets/riwayat.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text("Riwayat")
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 122, 235, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Image.asset(
                                    "assets/servis.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text("service")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text(
                          "TOKO SISTER KOMPUTER",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Jl. Sultan Hasanudin No. 1. Bandar Lampung, Lampung"),
                        Text('Melayani Pembelian Product Dan Service'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
