

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/utils/icons.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            width: 166,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFF00AFFF)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Saqlab qo'yish",
                    style: TextStyle(
                        color: Color(0xFF00AFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SvgPicture.asset(MyIcons.bookMark)
                ]),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            width: 166,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Yuklab olish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SvgPicture.asset(
                    MyIcons.iCloud,
                    color: Colors.white,
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
