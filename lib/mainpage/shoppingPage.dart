import 'dart:html';
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:go_router/go_router.dart';
import '../clipper/folder_clipath.dart';
import '../clipper/invoice_clipath.dart';

Color colorDefault = Colors.purple;
TextEditingController _NameInvoice = TextEditingController();
TextEditingController _Namakasir = TextEditingController();

class ShoppingPage extends StatefulWidget {
  final GoRouterState? goRouterState;
  const ShoppingPage({super.key, this.goRouterState});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final _formKey = GlobalKey<FormState>();
  int jmlBeli = 0;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    final String nama = widget.goRouterState!.queryParams['nama'] as String;
    final String qty = widget.goRouterState!.queryParams['qty'] as String;
    final String price = widget.goRouterState!.queryParams['price'] as String;
    final String detail = widget.goRouterState!.queryParams['detail'] as String;

    var harga = int.parse(price);
    assert(harga is int);

    var stock = int.parse(qty);
    assert(stock is int);

    var TotalAmout = harga * jmlBeli;

    void _tambahjmlbeli() {
      setState(() {
        jmlBeli++;
      });
    }

    void _kurangJumlahBeli() {
      setState(() {
        jmlBeli--;
      });
    }

    var jumlahstok = jmlBeli - stock;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference invoice = firestore.collection('invoice');

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("incvoice Overview"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ClipPath(
        clipper: FolderClipath(),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kasir :",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextFormField(
                              controller: _Namakasir,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pembayaran",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          "${TotalAmout}" + " .000",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: colorDefault),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ClipPath(
                    clipper: InvoiceHeaderClipper(),
                    child: Container(
                      color: Color.fromARGB(255, 58, 141, 236),
                      height: 110,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Colors.black54,
                              ),
                              Text(
                                "Invoice",
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Nama Pelanggan"),
                              Container(
                                margin: EdgeInsets.all(4),
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextFormField(
                                    controller: _NameInvoice,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: ClipPath(
                      clipper: InvoiceContentClipper(),
                      child: Container(
                        color: Color(0XFFDCA5B3),
                        padding: EdgeInsets.all(15),
                        child: Column(children: [
                          Row(
                            children: [
                              Icon(
                                Icons.file_copy,
                                color: colorDefault,
                              ),
                              Text(
                                "invoice details",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: colorDefault),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  // alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Product deskription :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            detail,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: colorDefault),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Tanggal Invoice :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${DateFormat.yMMMd().add_jm().format(currentTime)}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: colorDefault),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 5,
                            color: Colors.black,
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          Container(
                            width: double.infinity,
                            height: 20,
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Items"),
                                Text("Stok"),
                                Text("Harga"),
                                Text("Jumlah beli"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(nama),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Container(
                                        width: 60,
                                        height: 30,
                                        color: Colors.transparent,
                                        child: Text("${(stock)}" + " unit")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                        width: 60,
                                        height: 30,
                                        color: Colors.transparent,
                                        child: Text("${harga}" + ".000")),
                                  ),
                                  Container(
                                    width: 110,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            color: Colors.blue,
                                            child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {
                                                _kurangJumlahBeli();
                                              },
                                              icon: Icon(Icons.remove),
                                              iconSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "${jmlBeli}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            color: Colors.blue,
                                            child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {
                                                _tambahjmlbeli();
                                              },
                                              icon: Icon(Icons.add),
                                              iconSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 5,
                            color: Colors.black,
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.transparent,
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Text("Stok Tersedia : "),
                                Text("${stock - jmlBeli}" + " pcs")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 30,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_left_outlined,
                                      color: colorDefault,
                                    ),
                                    label: const Text(
                                      "Batal",
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 30,
                                  color: Color.fromARGB(255, 243, 195, 23),
                                  child: TextButton(
                                    onPressed: () async {
                                      var datas = await invoice.add({
                                        "kasir": _Namakasir.text,
                                        "customer": _NameInvoice.text,
                                        "total": TotalAmout,
                                        "items": nama,
                                        "jumlah": jmlBeli,
                                        "status": "sukses",
                                      });
                                      _Namakasir.clear();
                                      _NameInvoice.clear();
                                      TotalAmout = 0;
                                      jmlBeli = 0;
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text("Invoice sudah disimpan"),
                                          content: TextButton(
                                              onPressed: () {
                                                context.goNamed('riwayat');
                                              },
                                              child: Text("Okee")),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Chek Out",
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 17),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<String?> addsubInvoice(
  //     String id, String name, String price, String qty) async {
  //   CollectionReference invoice =
  //       FirebaseFirestore.instance.collection('invoice');
  //   await invoice
  //       .doc(id)
  //       .collection('pesanan')
  //       .add({'name': name, 'harga': price, 'jumlah': qty});
  // }
}
