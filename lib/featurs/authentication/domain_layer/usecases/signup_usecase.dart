import '../../../../core/usecases/usecases.dart';
import '../repository/authentication_repository.dart';

class SignUpUseCase extends UseCse {
  AuthenticationRepository authenticationPepositpory;
  SignUpUseCase(
     this.authenticationPepositpory,
  );

  Future<bool> call(userEntity) async {
    return await authenticationPepositpory.signUp(userEntity);
  }
}