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
              child: const Text('OK' , style: TextStyle(fontSize: 18, color: Colors.black),),
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
        backgroundColor:  const Color.fromARGB(255, 226, 226, 226),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
             Padding(
               padding:  EdgeInsets.only(right: screenWidth*0.18),
               child: const Text("Your Feedback Is Welcome" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w800),),
             ),
             Padding(
               padding:  EdgeInsets.only(right: screenWidth*0.75 , top: screenHeight *0.019),
               child: const Text("Rate Us" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400),),
             ),
            Padding(
              padding:  EdgeInsets.only(right: screenWidth * 0.4 ,top: screenHeight *0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => IconButton(
                    icon: Icon(
                      index < _selectedStar ? Icons.star : Icons.star_border,
                      color: index < _selectedStar ? Colors.yellow : Colors.grey,
                    ),
                    onPressed: () => _handleStarSelection(index + 1),
                  ),
                ),
              ),
            ),
             SizedBox(height: screenHeight *0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
  width: double.infinity,
  child: Expanded(
    child: TextField(
      controller: _opinionController,
      maxLines:18, // Increase the number of lines
      decoration: const InputDecoration(
        hintText: 'Enter your Feedback...',
        border: OutlineInputBorder(),
      ),
    ),
  ),
),  ),
Padding(
  padding:  EdgeInsets.only(top: screenHeight * 0.009),
  child: SizedBox(
    width: screenWidth * 0.93,
    height: screenHeight * 0.08,
    child: ElevatedButton(
      onPressed: _submitOpinion,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(199, 146, 112, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Set border radius
        ),
        elevation: 5, // Add shadow
      ),
      child: const Text('Submit',style: TextStyle(fontSize: 20 , color: Colors.white),),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}


