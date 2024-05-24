import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewCard extends StatelessWidget {
  final String author;
  final String date;
  final int helpfulCount;
  final int notHelpfulCount;
  final double rating;
  final String title;
  final String content;

  const ReviewCard({
    Key? key,
    required this.author,
    required this.date,
    required this.helpfulCount,
    required this.notHelpfulCount,
    required this.rating,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: $author',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Date: $date', style: GoogleFonts.roboto()),
            const SizedBox(height: 8),
            Text('Rating: $rating/10', style: GoogleFonts.roboto()),
            const SizedBox(height: 8),
            Text('Title: $title',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content, style: GoogleFonts.roboto()),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Helpful: $helpfulCount', style: GoogleFonts.roboto()),
                Text('Not Helpful: $notHelpfulCount',
                    style: GoogleFonts.roboto()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
