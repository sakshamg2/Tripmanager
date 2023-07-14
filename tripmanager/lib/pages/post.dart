import 'package:flutter/material.dart';
import 'package:tripmanager/widgets/post_card.dart';

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
  final List<Post> _posts = [
    Post(text: 'text', images: ['assets/images/profile.png']),
    Post(text: 'text', images: ['assets/images/sarangkot.jpg']),
    Post(text: 'text', images: ['assets/images/splashscreen.png'])
  ];

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
    List<String> selectedImages =
        []; // Replace this with your logic to get selected images

    Post newPost = Post(text: text, images: selectedImages);
    setState(() {
      _posts.add(newPost);
    });

    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0081A7),
          title: const Text(
            'Post',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
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
            // Column(
            //   children: [
            //     Text('hi'),
            //     // buildPostItem(post)
            //     // ..._posts.map((post) => buildPostItem(post)).toList()
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _posts.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    PostCard(
                      post: _posts[index],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Post {
  final String text;
  final List<String> images;

  var comments;

  Post({required this.text, required this.images});
}
