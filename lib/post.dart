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
