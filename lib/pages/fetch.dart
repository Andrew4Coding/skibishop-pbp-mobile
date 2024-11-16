import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skibishop_mobile/ds/navbar.dart';

class FetchPage extends StatefulWidget {
  const FetchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FetchPageState createState() => _FetchPageState();
}

class _FetchPageState extends State<FetchPage> {
  List<dynamic> data = []; // Store fetched data here

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.http(
        'http://andrew-devito-eventyog.pbp.cs.ui.ac.id/yogforum/get_forum_by_ajax');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Success: ${response.statusCode}');
        setState(() {
          data = json.decode(response.body);
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Skibishop',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['body']),
                );
              },
            ),
    );
  }
}
