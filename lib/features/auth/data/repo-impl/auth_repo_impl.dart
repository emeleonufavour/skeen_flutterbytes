import 'package:fpdart/fpdart.dart';
import 'package:skeen/cores/cores.dart';
import 'package:skeen/features/features.dart';

class AuthRepoImpl extends AuthRepository with RepositoryErrorHandler {
  final AuthRemoteDataSource _authDataSource;

  AuthRepoImpl({
    required AuthRemoteDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    return callAction(() => _authDataSource.forgotPassword(email));
  }

  @override
  Future<Either<Failure, AuthResultEntity>> login({
    required String email,
    required String password,
  }) async {
    return callAction(() => _authDataSource.login(email, password));
  }

  @override
  Future<Either<Failure, AuthResultEntity>> register(
    SignUpParamsModel signUpParams,
  ) async {
    return callAction(() => _authDataSource.signUp(signUpParams));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return callAction(() => _authDataSource.logOut());
  }

  @override
  Future<Either<Failure, AuthResultEntity>> signInWithGoogle() async {
    return callAction(() => _authDataSource.signInWithGoogle());
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    return callAction(() => _authDataSource.isLoggedIn());
  }
}
