import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference invoice = firestore.collection('invoice');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 15,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "RIWAYAT PENJUALAN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 560,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 122, 235, 225),
                      borderRadius: BorderRadius.circular(5)),
                  child: StreamBuilder(
                      stream: invoice.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot snap =
                                  snapshot.data!.docs[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                child: Container(
                                  width: 90,
                                  height: 110,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Status : ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Text(
                                              snap['status'] + " !",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Image.asset(
                                                  'assets/mouse.png',
                                                  width: 50,
                                                  height: 50),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "kasir",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .caption,
                                                        ),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(snap['kasir'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text("Customer",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(snap['customer'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text("Waktu",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(
                                                            "${DateFormat.yMMMd().add_jm().format(currentTime)}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "item",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .caption,
                                                        ),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(snap['items'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text("Jumlah",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(
                                                            "${snap['jumlah'.toString()]}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Row(
                                                      children: [
                                                        Text("Total",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text(":",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                        Text("${snap['total']}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.teal),
                            ),
                          );
                        }
                      }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
