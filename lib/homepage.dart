import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
Future<void> fetchData() async {
  final headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMjlkZDUwYmMzM2M0ZGY3OWFiZTI3YjFlYWE4N2VlZCIsInN1YiI6IjY0MmUzNmU0MmRjNDRlMDEyNzExZDA3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.w3nG2QqaveTBg7c_iDy-Iug5ALeRnnABBTJOMS9_GTw',
  };
  final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated'),
      headers: headers
  );

  if (response.statusCode == 200) {
    // Successfully retrieved data
    final jsonData = json.decode(response.body);

  } else {
    // Handle error
    print('Request failed with status: ${response.statusCode}');
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
