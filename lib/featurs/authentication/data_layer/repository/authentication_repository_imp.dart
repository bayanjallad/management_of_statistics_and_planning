import '../../domain_layer/repository/authentication_repository.dart';
import '../data_sources/remote/auth_api_service_imp.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository{
 final AuthApiServiceImp authApiServiceImp;
 AuthenticationRepositoryImp(this.authApiServiceImp,);

  @override
  Future<bool> signUp(userEntity) async {
    try{
       await authApiServiceImp.signUp(userEntity);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}