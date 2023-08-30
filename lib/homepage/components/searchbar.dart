// import 'package:flutter/material.dart';
// import 'package:mv_flutter/homepage/class_model/movie.dart';
// import 'package:mv_flutter/homepage/components/network_request.dart';

// class SearchBar extends StatefulWidget {
//   @override
//   _SearchBarState createState() => SearchBarState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   NetworkRequest.fetchMovies();
//   List<String> filteredMovies = [];

//   @override
//   void initState() {
//     filteredMovies = movies;
//     super.initState();
//   }

//   void filterMovies(String query) {
//     setState(() {
//       filteredMovies = movies
//           .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: filterMovies,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredMovies.length,
//               itemBuilder: (context, index) {
//                 r  eturn ListTile(
//                   title: Text(filteredMovies[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
