// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/model/youtube_video.dart';

class VideoListWidget extends StatefulWidget {
  const VideoListWidget({
    Key? key,
    required this.videos,
    required this.shorts,
  }) : super(key: key);

  final List<YoutubeVideo> videos;
  final List<YoutubeVideo> shorts;

  @override
  State<VideoListWidget> createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  String formatViewCount(int viewCount) {
    if (viewCount >= 100000000) {
      return '${(viewCount / 100000000).toStringAsFixed(0)}억회';
    } else if (viewCount >= 10000) {
      return '${(viewCount / 10000).toStringAsFixed(0)}만회';
    } else if (viewCount >= 1000) {
      return '${(viewCount / 1000).toStringAsFixed(0)}천회';
    } else {
      return '$viewCount 회';
    }
  }

  String formatUploadDate(DateTime uploadTime) {
    DateTime currenDate = DateTime.now();

    Duration difference = currenDate.difference(uploadTime);
    int daysAgo = difference.inDays;

    if (daysAgo < 7) {
      return '$daysAgo일전';
    } else if (daysAgo < 30) {
      return '${(daysAgo / 7).floor()}주 전';
    } else if (daysAgo < 365) {
      return '${(daysAgo / 30).floor()}달 전';
    } else {
      return '${(daysAgo / 365).floor()}년 전';
    }
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final youtubeVideos = widget.videos..shuffle(random);
    final youtubeShorts = widget.shorts..shuffle(random);
    int shortIndex = random.nextInt(youtubeVideos.length);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: youtubeVideos.length,
      itemBuilder: (context, index) {
        return index == 1
            ? Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: youtubeShorts.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                youtubeShorts[index].thumnail,
                                width: 200,
                              ),
                            ),
                            const Positioned(
                              right: -20.0,
                              child: Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '${youtubeShorts[index].title} test',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      '조회수 ${formatViewCount(youtubeShorts[index].viewCount)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            : Column(
                children: [
                  Image.network(
                    youtubeVideos[index].thumnail,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://i.namu.wiki/i/cvGl4ZNRAlsZmBVZtVs_Iar9IuP42IExjHcEoc_Z2YdOx8M4ZsUleqFQJrNmQcNS87QpFbzNvti1GrmoGsNeR2z6SZyd25MCQM_9SirDrufw5KBFSalgTZQjH1VUf1LzJpsvF9t-0eQ9Xg9yh-lIfA.webp'),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                youtubeVideos[index].title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  youtubeVideos[index].uploadId.length > 20
                                      ? SizedBox(
                                          width: 200,
                                          child: Text(
                                            youtubeVideos[index].uploadId,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white54,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        )
                                      : Text(
                                          youtubeVideos[index].uploadId,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white54,
                                          ),
                                        ),
                                  const Text(
                                    ' · ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Text(
                                    formatViewCount(
                                        youtubeVideos[index].viewCount),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  const Text(
                                    ' · ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Text(
                                    formatUploadDate(
                                        youtubeVideos[index].uploadTime),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
      },
    );
  }
}
