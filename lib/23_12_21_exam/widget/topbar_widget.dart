// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/model/youtube_user.dart';

class TopbarWidget extends StatefulWidget {
  const TopbarWidget({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  final YoutubeUser userInfo;

  @override
  State<TopbarWidget> createState() => _TopbarWidgetState();
}

class _TopbarWidgetState extends State<TopbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 16.0,
                  ),
                  Image.asset(
                    'assets/images/youtube/icon-youtube-red-256.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    'YouTube',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'D2Coding',
                      letterSpacing: -3.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      if (widget.userInfo.alertCount > 0)
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16.0,
                            minHeight: 16.0,
                          ),
                          child: Text(
                            widget.userInfo.alertCount > 9
                                ? '9+'
                                : '${widget.userInfo.alertCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Icon(
                    Icons.connected_tv,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  ClipOval(
                    child: Image.network(
                      widget.userInfo.userPhoto,
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
