import 'package:supabase_flutter/supabase_flutter.dart';
import 'model.dart';

final supabase = Supabase.instance.client;


abstract class CoreSrvice{
  Stream<List<ChatModel>>getMessages();
  Future<bool>addMessage(chatModel);
}


class ServicesImp implements CoreSrvice{
  @override
  Stream<List<ChatModel>> getMessages() {
   var messages= supabase.from("Chat").select('*').then((value) => value.map((e) => ChatModel.fromJson(e)).toList());
   print(messages);
    return messages.asStream();
  }

  Future<bool>addMessage(chatModel) async{
     await supabase.from('Chat').insert({
      "message": chatModel.message,
      "is_me": false
    }).select();
    return true;
  }
}
