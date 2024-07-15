import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../provider/form.dart';

class AllForms extends StatelessWidget {
  const AllForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:  lightYellow,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3,vertical: MediaQuery.of(context).size.height*0.1),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: brown,
                  offset: Offset(0,0),
                  spreadRadius: 0.001,
                  blurRadius:12.5,
                )
              ]
            ),
            child: Column(
              children: [
                SizedBox(height: 16,),
                Text(formsInfo,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: brown,
                    offset: Offset(1,1),
                    spreadRadius: 0.0001,
                    blurRadius:1.0,
                  )
                ]  ),),
                SizedBox(height: 30,),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, _) {
                      return ref.watch(getData).when(
                        data: (data) {
                            return ListView.builder(
                                itemCount: data[0].usesAndForms.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 150,
                                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,vertical: MediaQuery.of(context).size.height*0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: pink,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top: 18.0),
                                           child: Text(data[0].usesAndForms[index].forms.nameForm,style: TextStyle(color: brown,fontFamily:"Josefin Sans", fontSize: 22, fontWeight: FontWeight.bold,shadows: [
                                              BoxShadow(
                                                color: brown,
                                                offset: Offset(1,1),
                                                spreadRadius: 0.00001,
                                                blurRadius:1.0,
                                              )
                                            ]  ),
                                        ),
                                         ),
                                        ButtonCustom(180, 50,
                                            Text(fillIn,style: TextStyle(fontFamily:"Josefin Sans", fontSize: 20,color: brown,shadows: [
                                              BoxShadow(
                                                color: brown,
                                                offset: Offset(1,1),
                                                spreadRadius: 0.00001,
                                                blurRadius:1.0,
                                              )
                                            ]),)
                                            ,lightYellow, brown, () async{nameForm=data[0].usesAndForms[index].forms.nameForm;print(nameForm);
                                              Navigator.pushNamed(context, '/Questions');
                                          }
                                        )
                                      ],
                                    ),
                                  );
                                },
                            );
                        },
                        error: (error, stackTrace) {
                          return Text(errorS);
                        },
                        loading: () {
                          return Center(
                            child: CupertinoActivityIndicator(color: pink,),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
