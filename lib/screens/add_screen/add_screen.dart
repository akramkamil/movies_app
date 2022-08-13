import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/all_movies_screen/all_movies_screen.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var nameController= TextEditingController();
  var descController= TextEditingController();
  var imageController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    var _moviesProvider= context.read<MoviesProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const MoviesScreen()));
          }, icon: const Icon(Icons.movie))
        ],
        title: const Text('Add Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Movie Title'
                  ),
                  controller: nameController,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Movie description'
                  ),
                  controller: descController,
                  maxLines: 10,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Image url'
                  ),
                  controller: imageController,
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              _moviesProvider.addMovies(nameController.text, descController.text, imageController.text);
              setState(() {
                nameController.text= '';
                imageController.text='';
                descController.text= '';
              });
            },
                child: const Text('Add Movie'))
          ],
        ),
      ),
    );
  }
}
