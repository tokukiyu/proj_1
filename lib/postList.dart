import 'package:flutter/material.dart';

import './post.dart';

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
                    color: post.userLiked ? Colors.green : Colors.black,
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
