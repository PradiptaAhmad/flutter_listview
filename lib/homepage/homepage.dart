import 'package:flutter/material.dart';
import 'package:mv_flutter/homepage/class_model/movie.dart';
import 'package:mv_flutter/homepage/components/network_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: FutureBuilder<List<Results>>(
        future: NetworkRequest.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No movies available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return Container(
                  child: Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                        width: 50,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      title: Text(movie.title.toString()),
                      subtitle: Text('Release: ${movie.releaseDate}'),
                      trailing: Text('Rating: ${movie.voteAverage}'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
