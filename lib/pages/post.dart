import 'package:flutter/material.dart';

void main() {
  runApp(const PostPage());
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _selectedImages = [];
  final List<Post> _posts = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _chooseImage() async {
    // Implement the logic to choose an image from the gallery
    // and add the selected image to the _selectedImages list
  }

  void _post() {
    String text = _textEditingController.text;
    List<String> images = List.from(_selectedImages);
    Post post = Post(text: text, images: images);
    setState(() {
      _posts.add(post);
    });
    _textEditingController.clear();
    _selectedImages.clear();
  }

  void _likePost(int index) {
    setState(() {
      _posts[index].likes++;
    });
  }

  void _dislikePost(int index) {
    setState(() {
      _posts[index].dislikes++;
    });
  }

  void _addComment(int index, String comment) {
    setState(() {
      _posts[index].comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0081A7),
          title:
              const Text('Post Page', style: TextStyle(fontFamily: 'Poppins')),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _post,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            hintText: "What's on your mind?",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: _chooseImage,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Previous Posts',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_circle),
                            SizedBox(width: 10),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Posted on ${_posts[index].getDate()}',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _posts[index].text,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _posts[index].images.length,
                          itemBuilder: (context, imgIndex) {
                            return Image.asset(_posts[index].images[imgIndex]);
                          },
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () => _likePost(index),
                            ),
                            Text(_posts[index].likes.toString()),
                            IconButton(
                              icon: Icon(Icons.thumb_down),
                              onPressed: () => _dislikePost(index),
                            ),
                            Text(_posts[index].dislikes.toString()),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text('Comments'),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _posts[index]
                              .comments
                              .map((comment) => Text(comment))
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Add a comment',
                          ),
                          onSubmitted: (comment) => _addComment(index, comment),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post {
  final String text;
  final List<String> images;
  int likes;
  int dislikes;
  List<String> comments;

  Post({
    required this.text,
    required this.images,
    this.likes = 0,
    this.dislikes = 0,
    this.comments = const [],
  });

  String getDate() {
    // Implement logic to get the date of the post
    return 'July 2, 2023';
  }
}
