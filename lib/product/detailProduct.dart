import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class DetailProductPage extends StatefulWidget {
  final GoRouterState? goRouterState;
  DetailProductPage({super.key, this.goRouterState});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    final String nama = widget.goRouterState!.queryParams['nama'] as String;
    final String qty = widget.goRouterState!.queryParams['qty'] as String;
    final String price = widget.goRouterState!.queryParams['price'] as String;
    final String detail = widget.goRouterState!.queryParams['detail'] as String;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference product = firestore.collection('product');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width * 9,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.green.shade200),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 9,
                  height: 270,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: ClipOval(
                                  child: IconButton(
                                    onPressed: () {
                                      context.goNamed('product');
                                    },
                                    icon:
                                        Icon(Icons.arrow_circle_left_outlined),
                                    iconSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.arrow_circle_right_outlined),
                                        iconSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.shopping_cart),
                                        iconSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert_sharp),
                                        iconSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/mouse.png',
                          width: 170,
                          height: 170,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width * 9,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Text(
                                  "Nama Produk    ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.orange.shade600),
                                ),
                                Text(": "),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    nama,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Text("Stock Tersedia  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.orange.shade600)),
                                Text(": "),
                                Text(
                                  qty + " " + "Pcs",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Text(
                                  "Harga  ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.orange.shade600),
                                ),
                                Text("                  : "),
                                Text(
                                  "Rp. " + price + ".000-,",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 9,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                "Deskripsi Product :",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange.shade600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                width: 400,
                                child: Text(
                                  detail,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 9,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Rating",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.orange.shade600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 130,
                                height: 20,
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.yellow.shade500,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.yellow.shade500,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.yellow.shade500,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.yellow.shade500,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "4.0",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Terjual",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.orange.shade600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "10RB+ Terjual",
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Pengiriman",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.orange.shade600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Lampung",
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 9,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 247, 115, 27)),
                        child: TextButton(
                            onPressed: () {
                              context.goNamed('shop');
                            },
                            child: Text(
                              "Add To chart",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
