import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/data/db/storage.dart';
import 'package:untitled2/utils/icons.dart';

class PremiumItem extends StatelessWidget {
  const PremiumItem(
      {super.key,
      required this.text,
      required this.vectorIcon,
      required this.color,
      required this.id,
      required this.isPremium,
      required this.onChanged});
  final String text;
  final String vectorIcon;
  final Color color;
  final int id;
  final bool isPremium;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    late Timer? timer;
    int lastTap = DateTime.now().millisecondsSinceEpoch;
    int consecutiveTaps = 1;
    return GestureDetector(
      onTap: () {
        if (StorageRepository.getBool('premium$id')) {}

        int now = DateTime.now().millisecondsSinceEpoch;
        if (consecutiveTaps == 1) {
          lastTap = now;
        }
        if (now - lastTap < 300) {
          consecutiveTaps++;
          if (consecutiveTaps == 3) {
            StorageRepository.putBool('premium$id', false);
            Fluttertoast.showToast(msg: 'Premium yopildi');
            onChanged.call(true);
          }
        } else {
          consecutiveTaps = 1;
        }
        lastTap = now;
      },
      onPanCancel: () => timer?.cancel(),
      onPanDown: (_) => {
        timer = Timer(const Duration(seconds: 5), () {
          StorageRepository.putBool('premium$id', true);
          Fluttertoast.showToast(msg: 'Premium ochildi');
          onChanged.call(true);
        })
      },
      child: Container(
        height: 164,
        width: 164,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    vectorIcon,
                  ),
                  const Expanded(child:  SizedBox()),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white.withOpacity(0.20),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "0%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Visibility(
              visible: !isPremium,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      MyIcons.crown,
                      alignment: Alignment.center,
                      width: 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
