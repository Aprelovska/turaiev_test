part of 'bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.name = 'Artem Vilchinsky',
    this.followers = 6,
    this.likes = 6,
    this.following = 6,
    this.avatarUrl = 'https://sun2-4.userapi.com/s/v1/ig2/_4mbV-N3pnHaeujFLfA4jSpAbIYcmrV8SuLBUrAr0vLak7qCFI3r95pFdz_KwDUYYfSTEjZ8-BYVYs0j9cvvrwgd.jpg?size=100x0&quality=96&crop=0,0,1200,1200&ava=1',
    this.imgUrlList = const [
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
      'https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171__340.jpg',
      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      'https://i.pinimg.com/originals/83/64/66/83646654668bf9ae412f45bb2e417ddf.jpg',
      'https://image.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
      'https://images.ctfassets.net/hrltx12pl8hq/3MbF54EhWUhsXunc5Keueb/60774fbbff86e6bf6776f1e17a8016b4/04-nature_721703848.jpg?fit=fill&w=480&h=270',
      'https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg',
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
      'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
      'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      'https://media.istockphoto.com/photos/child-hands-formig-heart-shape-picture-id951945718?k=6&m=951945718&s=612x612&w=0&h=ih-N7RytxrTfhDyvyTQCA5q5xKoJToKSYgdsJ_mHrv0=',
      'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg',
      'https://analyticsindiamag.com/wp-content/uploads/2020/10/7d744a684fe03ebc7e8de545f97739dd.jpg',
    ],
  });

  final String name;
  final int followers;
  final int likes;
  final int following;
  final String avatarUrl;
  final List<String> imgUrlList;

  @override
  List<Object?> get props => [name, followers, likes, following];

  UserState copyWith({
    String? name,
    int? followers,
    int? likes,
    int? following,
    String? avatarUrl,
    List<String>? imgUrlList,
  }) => UserState(
    name: name ?? this.name,
    followers: followers ?? this.followers,
    likes: likes ?? this.likes,
    following: following ?? this.following,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    imgUrlList: imgUrlList ?? this.imgUrlList,
  );
}