import '../model/youtube_category.dart';
import '../model/youtube_user.dart';

class CategoryRepository {
  final List<YoutubeCategory> categories = [
    YoutubeCategory(
      categoryId: 1,
      categoryName: '전체',
      categoryChoice: 1,
    ),
    YoutubeCategory(
      categoryId: 2,
      categoryName: '게임',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 3,
      categoryName: '뉴스',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 4,
      categoryName: '음악',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 5,
      categoryName: '실시간',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 6,
      categoryName: '수학',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 7,
      categoryName: '액션 어드벤처 게임',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 8,
      categoryName: '요리',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 9,
      categoryName: '축구',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 10,
      categoryName: '최근에 업로드된 동영상',
      categoryChoice: 0,
    ),
    YoutubeCategory(
      categoryId: 11,
      categoryName: '새로운 맞춤 동영상',
      categoryChoice: 0,
    ),
  ];

  List<YoutubeCategory> getCategories() => categories;
}
