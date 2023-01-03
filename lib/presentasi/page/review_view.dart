import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: fontBlack,
            size: 20,
          ),
          onPressed: () => closePage(context),
        ),
        title: const Text(
          "Review pelanggan",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontBlack,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 12),
        children: [
          ...List.generate(
            4,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RatingBarIndicator(
                    rating: 4,
                    // initialRating: 3,
                    // minRating: 1,
                    direction: Axis.horizontal,
                    // allowHalfRating: true,
                    itemCount: 5,
                    // glow: false,
                    unratedColor: Colors.grey.shade200,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_purple500_sharp,
                      color: Colors.amber,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, bottom: 4),
                  child: Text(
                    "Kritik & saran:",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("sudah enak namun masih terasa pedas sekali"),
                const Divider(
                  thickness: 2,
                  color: Color(0xffeeeeee),
                ),
                const SizedBox(height: 12)
              ],
            ),
          )
        ],
      ),
    );
  }
}
