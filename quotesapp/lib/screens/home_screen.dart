import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:Platform.isIOS ? true : false,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                quote,
                style: const TextStyle(fontSize: 30, color: Colors.black87),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "- $author",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  )
                ),
            ),
            const SizedBox(height: 25.0,),
            ElevatedButton(
                onPressed: () async {

                  final url = Uri.parse('https://api.quotable.io/random');
                  final response = await http.get(url);
                  final data = jsonDecode(response.body);

                  setState(() {
                    quote = data["content"];
                    author = data["author"];
                  });

                },
                child:const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child:  Text("Get Quote!",style: TextStyle(fontSize: 20),),
                ),
              ),
          ],
        ),
      ),
    );
  }
}