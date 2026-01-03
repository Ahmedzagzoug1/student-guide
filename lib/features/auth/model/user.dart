import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class UserModel {

   final String firstName;
    final  String lastName;
    final String email;
    final String classNumber;
    final String imageUrl;
    final DateTime registerAt;
UserModel({required this.firstName ,required this.lastName ,required this.email ,required this.classNumber ,required this.imageUrl ,required this.registerAt });
   factory UserModel.fromJson(Map<String, dynamic> json) =>
       _$UserModelFromJson(json);

   Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
