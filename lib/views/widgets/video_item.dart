
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/utils/icons.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(children: [
            Image.asset(
              MyIcons.img1,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.6, 0.95]),
                ),
              ),
            ),
            const Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                "How to speak like a native",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: SvgPicture.asset(MyIcons.playCircle))
          ]),
        ),
      ),
    );
  }
}
