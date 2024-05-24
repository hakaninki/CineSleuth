import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  List<dynamic> reviews = [];

  Future<void> fetchReviews() async {
    final String name = nameController.text;
    final String year = yearController.text;

    if (name.isNotEmpty && year.isNotEmpty) {
      final Uri uri = Uri.http('localhost:5000', '/getReviews', {
        'name': name,
        'year': year,
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        setState(() {
          reviews = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load reviews');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Year'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: fetchReviews,
              child: Text('Fetch Reviews'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ListTile(
                    title: Text(review['title']),
                    subtitle: Text(review['content']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReviewPage(),
  ));
}
