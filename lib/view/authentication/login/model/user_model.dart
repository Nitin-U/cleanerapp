class UserModel {
  String? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // ignore: unnecessary_new
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? slug;
  String? email;
  String? image;
  String? contact;
  String? address;
  String? gender;
  int? status;
  String? oauthId;
  String? oauthType;
  String? userType;
  String? about;
  String? cover;
  String? fb;
  String? insta;
  String? twitter;
  String? linkedin;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
      this.name,
      this.slug,
      this.email,
      this.image,
      this.contact,
      this.address,
      this.gender,
      this.status,
      this.oauthId,
      this.oauthType,
      this.userType,
      this.about,
      this.cover,
      this.fb,
      this.insta,
      this.twitter,
      this.linkedin,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    image = json['image'];
    contact = json['contact'];
    address = json['address'];
    gender = json['gender'];
    status = json['status'];
    oauthId = json['oauth_id'];
    oauthType = json['oauth_type'];
    userType = json['user_type'];
    about = json['about'];
    cover = json['cover'];
    fb = json['fb'];
    insta = json['insta'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['email'] = email;
    data['image'] = image;
    data['contact'] = contact;
    data['address'] = address;
    data['gender'] = gender;
    data['status'] = status;
    data['oauth_id'] = oauthId;
    data['oauth_type'] = oauthType;
    data['user_type'] = userType;
    data['about'] = about;
    data['cover'] = cover;
    data['fb'] = fb;
    data['insta'] = insta;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
