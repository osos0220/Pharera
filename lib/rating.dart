import 'package:flutter/material.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/Texti.dart';
import 'package:flutter_application_09/generated/l10n.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;
  final String _feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(child: Texti(size: 28,text: S.of(context).how)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
              
                maxLines: 15,
                decoration:  InputDecoration(
                  hintText: S.of(context).provide,
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                  focusColor: Colors.amber,
                  fillColor: Colors.amber,
                  hoverColor: Colors.amber
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle rating submission and feedback
                  if (_rating > 0 && _feedback.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Texti(size: 10,text: S.of(context).thanks),
                        content: Texti(size: 10,text: S.of(context).feed),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextW(text: S.of(context).ok),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: TextW(text: S.of(context).incomplete),
                        content: TextW(text: S.of(context).please),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextW(text: S.of(context).ok),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: TextW(text: S.of(context).submit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
