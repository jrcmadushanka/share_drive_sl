class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String status;
  final String phone;
  final String address;
  final String verificationType;
  final String userImage;
  final String verificationImageOne;
  final String verificationImageTwo;
  final bool didAgreeToPolicies;

  UserModel(
      this.id,
      this.firstName,
      this.lastName,
      this.password,
      this.email,
      this.phone,
      this.address,
      this.status,
      this.verificationType,
      this.userImage,
      this.verificationImageOne,
      this.verificationImageTwo,
      this.didAgreeToPolicies);
}
