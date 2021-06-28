// import 'package:akses_lokasi/Screen/lokasi.dart';
import 'package:flutter/material.dart';
import 'package:sharedpref/Screen/Screen_RMQ.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan',
      home: Rmq_Demo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
