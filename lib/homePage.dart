import 'package:flutter/material.dart';
import './inputText.dart';
import './postList.dart';
import './post.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(new Post(text, "author"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("hello flutter one"),
      ),
      body: Column(children: [
        Expanded(child: PostList(posts: posts)), // Pass posts as a parameter
        InputW(newPost),
      ]),
    );
  }
}
