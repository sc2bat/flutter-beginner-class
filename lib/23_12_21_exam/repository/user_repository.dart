import '../model/youtube_user.dart';

class UserRepository {
  final YoutubeUser user = YoutubeUser(
    userId: 'nobody',
    alertCount: 999,
    userPhoto:
        'https://i.namu.wiki/i/4I1Y3FXHWTBIIbfp73QrnSffNbHBtgRCez1nL0ewSrtMS3B4fn84LHrnsdWj0A-RlMpOOUckPeuYE7nF5VN3oNz9N-S3iwGCiQZe5vEHOkmLNC3Zd75uewn4gxb0swZBs2WZq6codik_h3jtbA0v5w.webp',
  );

  YoutubeUser getUser() => user;
}
