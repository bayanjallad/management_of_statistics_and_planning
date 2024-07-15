import '../../domain_layer/entities/all_forms_entity.dart';
import '../../domain_layer/entities/question_entity.dart';
import '../../domain_layer/repository/form_repository.dart';
import '../data_source/remote/form_srevice_imp.dart';

class FormRepositoryImp implements FormRepository{
  final FormApiServiceImp formApiServiceImp;
  FormRepositoryImp(this.formApiServiceImp);
  @override
  Future<List<AllFormsEntity>> getAllForms() async {
    try{
     final res= await formApiServiceImp.getAllFormsApi();
      return res;
    }catch(e){
      print(e);
      return [];
    }
  }

  @override
  Future<List<QestionsEntity>> getQestionsForms(nameForm) async{
    try{
      final res= await formApiServiceImp.getQestionsFormsApi(nameForm);
      return res;
    }catch(e){
      print(e);
      return [];
    }
  }
}