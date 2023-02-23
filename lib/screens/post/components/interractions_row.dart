import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class InterractionsRow extends StatelessWidget {
  const InterractionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LikeButton(
          likeCountAnimationType: LikeCountAnimationType.all,
          likeCount: 0,
          countBuilder: (count, isLiked, text) {
            Widget result;
            if (count == 0) {
              result = Text(
                "",
                style: GoogleFonts.inter(color: Colors.red),
              );
            } else {
              result = Text(
                text,
                style: GoogleFonts.inter(color: Colors.red),
              );
            }
            return result;
          },
        ),
        const SizedBox(
          width: 20,
        ),
        LikeButton(
          likeBuilder: (isLiked) {
            return Icon(
              Icons.mode_comment_rounded,
              color: isLiked ? Colors.deepOrangeAccent : Colors.grey.shade500,
            );
          },
          likeCount: 0,
          countBuilder: (count, bool isCommented, String text) {
            var color = isCommented ? Colors.orange : Colors.red;
            Widget result;
            if (count == 0) {
              result = Text(
                "",
                style: TextStyle(color: color),
              );
            } else {
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            }
            return result;
          },
        )
      ],
    );
  }
}
