import 'package:ewarungapps/modelGrafik/omset.dart';
import 'package:flutter/material.dart';
import '../modelGrafik/grafikOmset.dart';
import 'package:go_router/go_router.dart';

var _primaryCollor = Colors.green.shade400;

class grafikPage extends StatefulWidget {
  @override
  State<grafikPage> createState() => _grafikPageState();
}

class _grafikPageState extends State<grafikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryCollor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(color: Colors.blueGrey.shade400),
              child: Center(child: Text("Data penjualan ")),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("per minggu")),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("per Hari"))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: _primaryCollor),
                  width: 350,
                  height: 200,
                  child: ngomsetLine(),
                ),
              ],
            ),
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
