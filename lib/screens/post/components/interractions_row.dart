import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:travel_tog/screens/comments/comment_screen.dart';
import 'package:travel_tog/size_config.dart';

class InterractionsRow extends StatefulWidget {
  const InterractionsRow({
    super.key,
  });

  @override
  State<InterractionsRow> createState() => _InterractionsRowState();
}

class _InterractionsRowState extends State<InterractionsRow> {
  bool isLiked = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          visualDensity: VisualDensity.compact,
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: isLiked ? Colors.redAccent : Colors.black54,
            // size: 14,
          ),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          constraints: const BoxConstraints(),
          visualDensity: VisualDensity.compact,
          icon: const Icon(
            Icons.mode_comment_outlined,
            color: Colors.black54,
          ),
          onPressed: () {
            showModalBottomSheet(
                constraints: BoxConstraints.tightFor(
                    height: MediaQuery.of(context).size.height / 2),
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                builder: (context) {
                  return CommentScreen();
                });
          },
        ),
        const Spacer(),
        IconButton(
          constraints: const BoxConstraints(),
          visualDensity: VisualDensity.compact,
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
            color: Colors.black54,
            // size: 14,
          ),
          onPressed: () {
            setState(() {
              isBookmarked = !isBookmarked;
            });
          },
        )
      ],
    );
  }
}
