import 'package:ewarungapps/modelGrafik/omset.dart';
import 'package:flutter/material.dart';
import '../modelGrafik/grafikOmset.dart';
import 'package:go_router/go_router.dart';

class grafikPage extends StatefulWidget {
  @override
  State<grafikPage> createState() => _grafikPageState();
}

class _grafikPageState extends State<grafikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 30,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade400,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade400,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text("Data penjualan ")),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Perminggu",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade400,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Perbulan",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.green.shade400),
                  width: 350,
                  height: 200,
                  child: ngomsetLine(),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.green.shade400),
              width: 350,
              height: 200,
              child: data(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/home');
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}



// Widget content() {
//   return Column(
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         child: Text("Data penjualan "),
//       ),
//       Container(
//         decoration: BoxDecoration(color: _primaryCollor),
//         width: 300,
//         height: 300,
//         child: ngomsetLine(omset),
//       ),
//     ],
//   );
// }
