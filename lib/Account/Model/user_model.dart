class UserModel {
  final String? userID;
  final String? userName;
  final String? userAddress;
  final String? userProfileURl;

  UserModel({
    this.userID,
    this.userName,
    this.userAddress,
    this.userProfileURl,
  });

  UserModel.fromJson(Map<String, dynamic> res, String id)
      : this(
          userID: id,
          userName: res['user_name'] as String,
          userAddress: res['user_address'] as String,
          userProfileURl: res['user_profile'] as String,
        );
}
