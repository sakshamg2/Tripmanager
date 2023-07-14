import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int _selectedEmoji = -1; // -1 means no emoji selected
  int _selectedRating = -1; // -1 means no rating selected
  //int _currentRating = 0; // current rating starts at 0
  final TextEditingController _feedbackTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081A7),
        title: const Text('Feedback'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF0081A7),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: ' What do you think of our app?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: '      * Required',
                            style: TextStyle(
                              color: Color(0xFF0081A7),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEmojiButton(0, '😄'),
                _buildEmojiButton(1, '😊'),
                _buildEmojiButton(2, '😐'),
                _buildEmojiButton(3, '😔'),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF0081A7),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'What do you want to share with us?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: '      * Required',
                            style: TextStyle(
                              color: Color(0xFF0081A7),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _feedbackTextController,
              maxLines: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF0081A7),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'How will you rate us?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: '      * Required',
                            style: TextStyle(
                              color: Color(0xFF0081A7),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRatingStarButton(1),
                _buildRatingStarButton(2),
                _buildRatingStarButton(3),
                _buildRatingStarButton(4),
                _buildRatingStarButton(5),
              ],
            ),
            const SizedBox(height: 32.0),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.5, // Adjust this value as needed
                  child: ElevatedButton(
                    onPressed: _isFeedbackComplete() ? _submitFeedback : null,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0081A7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20), // Add the desired padding
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiButton(int index, String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEmoji = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedEmoji == index ? Colors.amber : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: 36.0,
            color: _selectedEmoji == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStarButton(int rating) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRating = rating;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          Icons.star,
          size: 40.0,
          color: _selectedRating >= rating ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }

  bool _isFeedbackComplete() {
    return _selectedEmoji >= 0 &&
        _selectedRating >= 0 &&
        _feedbackTextController.text.isNotEmpty;
  }

  void _submitFeedback() {
    // Get the feedback data
    String feedbackText = _feedbackTextController.text;
    int rating = _selectedRating + 1; // Convert from 0-based to 1-based

    // Determine the selected emoji
    switch (_selectedEmoji) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }

    // Print the feedback data to the console
    print('Feedback submitted:');
    print('Emoji: emoji');
    print('Rating: $rating');
    print('Feedback text: $feedbackText');

    // Clear the feedback form
    setState(() {
      _selectedEmoji = -1;
      _selectedRating = -1;
      _feedbackTextController.clear();
    });
  }
}
