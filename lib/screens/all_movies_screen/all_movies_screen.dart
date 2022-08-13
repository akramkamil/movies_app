import 'package:flutter/material.dart';
import 'package:movies_app/providers/general_provider.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/add_screen/add_screen.dart';
import 'package:movies_app/screens/all_movies_screen/movie_tile.dart';
import 'package:movies_app/screens/more_info_screen/more_info_screen.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => MoviesScreenState();
}

class MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState (){
    super.initState();
    context.read<MoviesProvider>().getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    var generalProvider = context.watch<GeneralProvider>();
    var moviesProvider = context.read<MoviesProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: const MoreInfoScreen(),
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.only(top: 23, right: 10),
          child: Text('Hi ${generalProvider.selectedUser!.username}',
          style: TextStyle(
            fontSize: 12,
          ),),
        )],
        title: const Text('Movies Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          ElevatedButton(
              onPressed: () {
            setState((){

            });
          },
              child: const Text('show data')
          ),
        const SizedBox(
          height: 30,
        ),
        ListView.builder(
          shrinkWrap: true,
            itemCount: moviesProvider.movies.length,
            itemBuilder: (_, index) => MovieTile(moviesProvider.movies[index])
        ),
        ]
      ),
    );
  }
}
