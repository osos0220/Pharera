import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _selectedStar = 0;
  final TextEditingController _opinionController = TextEditingController();

  void _handleStarSelection(int starIndex) {
    setState(() {
      _selectedStar = starIndex;
    });
  }

  void _submitOpinion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank you for your Feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Ensure widgets stretch horizontally
          children: [
            const Padding(
              padding: EdgeInsets.only( top: 10),
              child: FittedBox(
                child: Row(
                  children: [
                    Text("Your Feedback Is Welcome",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only( top: screenHeight * 0.04 ,),
              child: const FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Rate Us",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only( top: screenHeight * 0.02),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      icon: Icon(
                        index < _selectedStar ? Icons.star : Icons.star_border,
                        color: index < _selectedStar ? Colors.yellow : Colors.grey,
                        size: 40,
                      ),
                      onPressed: () => _handleStarSelection(index + 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _opinionController,
                maxLines: 15,
                decoration: const InputDecoration(
                  hintText: 'Enter your Feedback...',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                  focusColor: Colors.amber,
                  fillColor: Colors.amber,
                  hoverColor: Colors.amber
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.009),
              child: SizedBox(
                height: screenHeight * 0.08,
                width: screenWidth*0.5,
                child: ElevatedButton(
                  onPressed: _submitOpinion,
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: const Color.fromARGB(199, 146, 112, 57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Text('Submit', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
