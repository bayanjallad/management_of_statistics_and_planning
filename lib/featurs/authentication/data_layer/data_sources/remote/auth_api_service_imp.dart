import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constantsStringApp.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/service/coreService.dart';
import '../../models/user_model.dart';
import 'auth_api_service.dart';

class AuthApiServiceImp implements AuthApiService{
  @override
  Future<bool> signUp(userEntity) async{
    print(apiTableUsersInfo);
    String jsonData = jsonEncode(UserModel.fromJson(userEntity));
    CoreService.responsee=await CoreService.dio.post(
        apiTableUsersInfo,
      data: jsonData,
      options: Options(
        headers: {
          'apikey':apikey
        }
      )
    );

    print(CoreService.responsee.statusCode);
    print(userEntity.firstName);
    Response response=await CoreService.dio.get(
        '${apiTableUsersInfo}?select=id&email=eq.${userEntity.email}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        )
    );
    user_id=response.data[0]['id'];
    print(user_id);

    //conditions
    if(userEntity.gender=='female'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 1
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.gender=='male'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 2
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.age<30){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 3
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.age>=30){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 4
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.yourStudy=='Not Student'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 5
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.yourStudy=='Primary School Student'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 6
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.yourStudy=='Secondry School Student'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 7
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    if(userEntity.yourStudy=='University Student'){
      CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":user_id,
            "form_id": 8
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    }
    return true;
  }
}