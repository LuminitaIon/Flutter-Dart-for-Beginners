import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotesapp/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                var url = Uri.parse('https://api.quotable.io/random');
                var response = await http.get(url);
                var data = jsonDecode(response.body);

                String quote = data["content"];
                String author = data["author"];

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SecondScreen(quoteText: quote, authorName: author,)));
              },
              child: Text("Go to next Screen"),
            ),
        ),
      ),
    );
  }
}