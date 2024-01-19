import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 0,
            actions: [
              Container(
                width: 34,
                margin: const EdgeInsets.only(right: 16),
                height: 34,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
              )
            ],
            titleSpacing: 0,
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('My Home',
                  style: TextStyle(
                    color: Color(0xFF0F0F0F),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  )),
            )),
        body: Column(children: []));
  }
}
