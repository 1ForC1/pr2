import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'admin',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
