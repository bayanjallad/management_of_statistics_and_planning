import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';
import 'model.dart';

class ChatPage extends ConsumerWidget {
   TextEditingController message=TextEditingController();


  @override
  Widget build(BuildContext context,ref) {
    final watch=ref.watch(getData);
    return Scaffold(
      body: Center(
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: watch.when(
                        data:(data){
                          return  ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return data[index].isMe
                                as bool
                                    ? SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                          child: Text(data[index].message.toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    : SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                          child: Text(data[index].message
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });

                        },
                        error: (error, stackTrace) {
                          return Text("errorS");
                        },
                        loading: () {
                          return Center(
                            child: CupertinoActivityIndicator(color: Colors.brown,),
                          );
                        },
                      )
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextField(
                              controller: message,
                              decoration:
                              InputDecoration(border: OutlineInputBorder()),
                            )),
                      ),
                      IconButton(
                          onPressed: () async {
                            ChatModel chatModel=ChatModel(message: message.text);
                            ref.read(chat).addMessage(chatModel);
                            // setState(() {});
                            message.clear();
                          },
                          icon: Icon(Icons.send))
                    ],
                  )
                ],

        ),
      ),
    );
  }
}
