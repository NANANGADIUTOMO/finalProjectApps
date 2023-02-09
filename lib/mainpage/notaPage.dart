import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NotaPage extends StatefulWidget {
  const NotaPage({super.key});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference invoice = firestore.collection('invoice');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: Stack(children: [
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "E-Nota",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                  ),
                  Text(
                    "TOKO SISTER KOMPUTER",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "Jl. RA. KARTINI No.2 Tanjung Karang Pusat, Bandar Lampung",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kasir",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "Date",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "_Namakasir.text",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "${DateFormat.yMMMd().add_jm().format(currentTime)}",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Customer :",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "_NameInvoice.text",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Total :",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "900",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "items",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "Price",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "Jumlah Beli",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: StreamBuilder(
                          stream: invoice.snapshots(),
                          builder: (context, snapshot) {
                            print(snapshot.data);
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot doc =
                                      snapshot.data!.docs[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Text(
                                                doc['name'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 40),
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${doc['price']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${doc['qty']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Expanded(
                        child: Container(
                      child: TextButton(
                          onPressed: () async {
                            context.goNamed('product');
                          },
                          child: Text("Confirm")),
                    )),
                  ),
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
