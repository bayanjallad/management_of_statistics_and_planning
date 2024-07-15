import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/usecases/signup_usecase.dart';

final Auth = StateNotifierProvider<AuthNotifier,AsyncValue<bool>>((ref) {
  return AuthNotifier(sl());
});

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final SignUpUseCase signUpUseCase;
  AuthNotifier(this.signUpUseCase) : super(AsyncValue.data(false));

  Future<bool> register(userEntity) async {
    state=AsyncValue.loading();
    await signUpUseCase.call(userEntity);
    state =  AsyncValue.data(false);
    return true;
  }
}
