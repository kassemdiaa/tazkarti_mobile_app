import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  const FaqItem({super.key, required this.question, required this.answer});
final String question;
final String answer;
  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔒 FIXED HEADER (never moves)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              widget.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              
              
            ),
          ),

          // 👇 ONLY THIS PART EXPANDS
          ClipRect(
            child: AnimatedAlign(
              alignment: Alignment.topLeft,
              heightFactor: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 8),
                  Text(widget.answer,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
