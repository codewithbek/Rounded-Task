
import 'package:flutter/material.dart';
import 'package:untitled2/utils/icons.dart';

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          MyIcons.img3,
          width: 96,
          height: 96,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Lesson 2",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black38),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "How to talk about nation\nAsilbek Asqarov Asilbek",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
