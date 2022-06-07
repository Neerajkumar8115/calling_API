import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  getApidata() async {
    var Url = Uri.parse('https://cat-fact.herokuapp.com/facts');
    http.Response respons = await http.get(Url);
    print(respons);
    if (respons.statusCode == 200) {
      final data = jsonDecode(respons.body);
      final text = data[0]['text'];
      print(text);
    } else {
      print('connection error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('call api'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              getApidata();
            },
            child: const Text('data'),
          ),
          const Text(
            'response',
          ),
        ]),
      ),
    );
  }
}
