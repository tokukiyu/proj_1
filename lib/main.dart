import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  String? body;
  String? author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);
  int likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
    return likes;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 101, 230)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
        Expanded(child: InputW(newPost)),
      ]),
    );
  }
}

class InputW extends StatefulWidget {
  final Function(String) callback;
  InputW(this.callback);

  @override
  State<InputW> createState() => _InputWState();
}

class _InputWState extends State<InputW> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the State object is disposed
    controller.dispose();
    super.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: click,
        ),
        labelText: "Type a message:",
      ),
    );
  }
}

class PostList extends StatefulWidget {
  final List<Post> posts;
  const PostList({Key? key, required this.posts});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        var post = widget.posts[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(post.body!),
                  subtitle: Text(post.author!),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        post.likes.toString(),
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                    onPressed: () => like(() => post.likePost()),
                    icon: Icon(Icons.thumb_up),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
