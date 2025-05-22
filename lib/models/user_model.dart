import 'package:hive/hive.dart';
part 'user_model.g.dart';
@HiveType(typeId: 3)
class UserModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String profilePic;

  UserModel({
    required this.name,
    required this.email,
    required this.profilePic,
  });



}