abstract interface class GoogleAuthRepository{
  Future<void> signIn();

  Future<void> logOut();
}