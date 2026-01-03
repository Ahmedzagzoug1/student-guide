class UserEntity {


    final String id;
   late String firstName;
  late  String lastName;
   late String email;
   late String imageUrl;

  UserEntity(  this.id, this.firstName, this.lastName, this.email, this.imageUrl);

    UserEntity.name(this.id);
}
