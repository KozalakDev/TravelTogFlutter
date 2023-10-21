import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeadlineText extends StatelessWidget {
  const AuthHeadlineText({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text,
          style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.black.withOpacity(0.80),
                  fontWeight: FontWeight.bold))),
    );
  }
}
