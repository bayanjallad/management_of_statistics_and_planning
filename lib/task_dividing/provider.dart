import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model.dart';
import 'srvice.dart';


final getData = StreamProvider<List<ChatModel>>((ref) {
  return ref.read(chat).getMessages();
});

final chat=StateProvider<ServicesImp>((ref){
  return ServicesImp();
});

