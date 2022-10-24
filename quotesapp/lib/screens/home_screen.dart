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
      child: Scaffold(
        appBar: AppBar(
        
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                quote, 
                style: TextStyle(fontSize: 30, color: Colors.black87),
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
            ElevatedButton(
                onPressed: () async {

                  var url = Uri.parse('https://api.quotable.io/random');
                  var response = await http.get(url);
                  var data = jsonDecode(response.body);

                  quote = data["content"];
                  author = data["author"];

                  setState(() {});

                },
                child: Text("Get Quote!"),
              ),
          ],
        ),
      ),
    );
  }
}