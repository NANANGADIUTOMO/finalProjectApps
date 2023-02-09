import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import '../mainpage/shoppingPage.dart';

TextEditingController _productName = TextEditingController();
TextEditingController _productQty = TextEditingController();
TextEditingController _productPrice = TextEditingController();
TextEditingController _productDetail = TextEditingController();
TextEditingController _searchField = TextEditingController();

var _primaryCollor = Colors.green.shade400;

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int tetxbadge = 0;
  final _formKey = GlobalKey<FormState>();

  void _tambahTextBagde() {
    setState(() {
      tetxbadge++;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference product = firestore.collection('product');
    CollectionReference invoice = firestore.collection('invoice');
    final editProductname = TextEditingController();
    final editProductQty = TextEditingController();
    final editProductprice = TextEditingController();
    final editProductdetail = TextEditingController();

    return Scaffold(
      backgroundColor: _primaryCollor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mobile-app.png'), fit: BoxFit.fill)),
        child: Center(
            child: SafeArea(
          child: Stack(children: [
            Column(children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 178, 240),
                          borderRadius: BorderRadius.circular(30)),
                      child: IconButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          icon: Icon(Icons.arrow_back_outlined)),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 17),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          suffixIcon: Icon(Icons.search, color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          fillColor: Color.fromARGB(255, 104, 178, 240),
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 104, 178, 240),
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Input Product',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return " Product Name cannot be empty";
                                            }
                                            return null;
                                          },
                                          controller: _productName,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Name',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: _productQty,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Product Qty',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: _productPrice,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Product Price',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: _productDetail,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Product Detail',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            'Cancel',
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text("Simpan Data?"),
                                                actions: [
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel');
                                                            _productName
                                                                .clear();
                                                            _productQty.clear();
                                                            _productPrice
                                                                .clear();
                                                            _productDetail
                                                                .clear();
                                                          },
                                                          child:
                                                              Text("Cancel")),
                                                      TextButton(
                                                          onPressed: () async {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              var user =
                                                                  FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid;
                                                              var docid =
                                                                  await product
                                                                      .add({
                                                                "name":
                                                                    _productName
                                                                        .text,
                                                                "qty": int.parse(
                                                                    _productQty
                                                                        .text),
                                                                "price": int.parse(
                                                                    _productPrice
                                                                        .text),
                                                                "detail":
                                                                    _productDetail
                                                                        .text,
                                                                "date":
                                                                    "(${DateTime.now()})"
                                                              }).then((value) =>
                                                                          value
                                                                              .id);
                                                              product.doc(docid).set(
                                                                  {"id": docid},
                                                                  SetOptions(
                                                                      merge:
                                                                          true));
                                                              _productName
                                                                  .clear();
                                                              _productQty
                                                                  .clear();
                                                              _productPrice
                                                                  .clear();
                                                              _productDetail
                                                                  .clear();
                                                            }
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Simpan"))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.add))),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 178, 240),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Badge(
                          badgeContent: Text(
                            "${(tetxbadge)}",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed('shop');
                            },
                            icon: Icon(Icons.shopping_bag),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 555,
                  margin: EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: StreamBuilder(
                      stream: product.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot documentSnapshot =
                                    snapshot.data!.docs[index];
                                return Padding(
                                    padding: EdgeInsets.all(6),
                                    child: GestureDetector(
                                        onTap: () {
                                          context.goNamed(
                                            'detailproduct',
                                            queryParams: {
                                              "nama": documentSnapshot['name'],
                                              "qty": documentSnapshot['qty']
                                                  .toString(),
                                              "price": documentSnapshot['price']
                                                  .toString(),
                                              "detail":
                                                  documentSnapshot['detail'],
                                              "id": documentSnapshot.id
                                            },
                                          );
                                        },
                                        child: Card(
                                          color: Color.fromARGB(
                                              255, 104, 178, 240),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          margin: const EdgeInsets.all(6),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/mouse.png',
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                )),
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                documentSnapshot['name'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Rp"
                                                    " ${documentSnapshot['price'.toString()]}"
                                                    ".000",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "stok"
                                                    " ${documentSnapshot['qty'.toString()]} "
                                                    "Pcs",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                )
                                              ],
                                            ),
                                            trailing: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      editProductname.text =
                                                          documentSnapshot[
                                                              'name'];
                                                      editProductQty.text =
                                                          documentSnapshot[
                                                                  'qty']
                                                              .toString();
                                                      editProductprice.text =
                                                          documentSnapshot[
                                                                  'price']
                                                              .toString();
                                                      editProductdetail.text =
                                                          documentSnapshot[
                                                              'detail'];
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  'Update User',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                content: Form(
                                                                  key: _formKey,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      TextFormField(
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "Name cannot be empty";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        controller:
                                                                            editProductname,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelText:
                                                                              'Nama',
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            editProductQty,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelText:
                                                                              'qty',
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            editProductprice,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelText:
                                                                              'price',
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            editProductdetail,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelText:
                                                                              'detail',
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: <
                                                                    Widget>[
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            context,
                                                                            'Cancel'),
                                                                        child:
                                                                            const Text(
                                                                          'Cancel',
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          await product
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'name':
                                                                                editProductname.text,
                                                                            'qty':
                                                                                editProductQty.text,
                                                                            'price':
                                                                                editProductprice.text,
                                                                            'detail':
                                                                                editProductdetail.text,
                                                                          });
                                                                          editProductname
                                                                              .clear();
                                                                          editProductQty
                                                                              .clear();
                                                                          editProductprice
                                                                              .clear();
                                                                          editProductdetail
                                                                              .clear();
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            'OK'),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ));
                                                    },
                                                    icon: Icon(Icons.edit),
                                                    color: Colors.green,
                                                  ),
                                                  IconButton(
                                                      onPressed: () async {
                                                        await product
                                                            .doc(
                                                                documentSnapshot
                                                                    .id)
                                                            .delete();
                                                      },
                                                      icon: Icon(Icons.delete),
                                                      color: Colors.red),
                                                  IconButton(
                                                      onPressed: () {
                                                        context.goNamed(
                                                          'shop',
                                                          queryParams: {
                                                            "nama":
                                                                documentSnapshot[
                                                                    'name'],
                                                            "qty":
                                                                documentSnapshot[
                                                                        'qty']
                                                                    .toString(),
                                                            "price":
                                                                documentSnapshot[
                                                                        'price']
                                                                    .toString(),
                                                            "detail":
                                                                documentSnapshot[
                                                                    'detail'],
                                                            "id":
                                                                documentSnapshot
                                                                    .id
                                                          },
                                                        );
                                                        // var productAdd =
                                                        //     await invoice.add({
                                                        //   "name":
                                                        //       documentSnapshot[
                                                        //           'name'],
                                                        //   "price":
                                                        //       documentSnapshot[
                                                        //           'price'],
                                                        //   "qty":
                                                        //       documentSnapshot[
                                                        //           'qty']
                                                        // });
                                                        // setState(() {
                                                        //   _tambahTextBagde();
                                                        // });
                                                      },
                                                      icon: Icon(
                                                          Icons.shopping_cart),
                                                      color: Colors.grey)
                                                ],
                                              ),
                                            ),
                                          ),
                                        )));
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.teal),
                            ),
                          );
                        }
                      })),
            ]),
          ]),
        )),
      ),
    );
  }
}
