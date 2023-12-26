import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_22_starbucks/repository/card_repository.dart';

class NewsCardListWidget extends StatefulWidget {
  const NewsCardListWidget({
    super.key,
  });

  @override
  State<NewsCardListWidget> createState() => _NewsCardListWidgetState();
}

class _NewsCardListWidgetState extends State<NewsCardListWidget> {
  final newsCardList = CardRepository().getNewsCards();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsCardList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/starbucks/${newsCardList[index].imageUrl}',
                        fit: BoxFit.cover,
                        height: 200.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      newsCardList[index].description,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(newsCardList[index].description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
