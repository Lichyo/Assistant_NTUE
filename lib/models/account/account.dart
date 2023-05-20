class Account {
  static Account? instance;
  final String userName;
  final String ID;
  final String email;
  final String password;

  Account({
    required this.userName,
    required this.password,
    required this.email,
    required this.ID,
  });


}
