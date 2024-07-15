import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../data_layer/models/user_model.dart';
import '../../domain_layer/entities/user_entity.dart';
import '../providers/auth_provider.dart';
import '../widgets/drop_down.dart';

class Signup extends StatelessWidget {
  final TextEditingController firstName=TextEditingController();
  final TextEditingController lastName=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController age=TextEditingController();
  final TextEditingController gender=TextEditingController();
  final TextEditingController yourStudy=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: lightYellow,
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,left: MediaQuery.of(context).size.width*0.08),
                child: Text(Register,style: TextStyle(color: brown,fontFamily:"Josefin Sans", fontSize: 80, fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: brown,
                    offset: Offset(3,1),
                    spreadRadius: 0.00001,
                    blurRadius:2.0,
                  )
                ]  ),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,left: MediaQuery.of(context).size.width*0.01),
                child: Text(notes,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 20, fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: brown,
                    offset: Offset(1,1),
                    spreadRadius: 0.00001,
                    blurRadius:1.0,
                  )
                ]  ),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01),
                child: Align(
                alignment:Alignment.bottomLeft,
                child: Image.asset('images/blueberry-cloud.png',scale: 0.60,)),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2,left: MediaQuery.of(context).size.width*0.02),
                child: Align(
                    alignment:Alignment.bottomLeft,
                    child:
                    Image.asset('images/girl-and-boy.png',scale: 0.66),)
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width *0.66,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                      BoxShadow(
                        color: brown,
                        offset: Offset(4,0),
                        spreadRadius: 0.001,
                        blurRadius:12.5,
                      )
                    ]
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.008,vertical: MediaQuery.of(context).size.height*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(firstNameS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child: TextFiledCustom( lightYellow, 1, firstName))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(lastNameS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child: TextFiledCustom( lightYellow, 1, lastName))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(emailS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child: TextFiledCustom( lightYellow, 1, email))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(ageS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child: TextFiledCustom( lightYellow, 1, age))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(genderS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child: DropDown("" ,gender,genderList)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(yourStudyS,style: TextStyle(color: pink,fontFamily:"Josefin Sans", fontSize: 30, fontWeight: FontWeight.bold,shadows: [
                              BoxShadow(
                                color: brown,
                                offset: Offset(1,1),
                                spreadRadius: 0.00001,
                                blurRadius:1.0,
                              )
                            ]  ),),
                            SizedBox(width: MediaQuery.of(context).size.width*0.3,child:DropDown("" ,yourStudy,yourStudyList),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Consumer(
                            builder: (context, ref, child) {
                              return  ButtonCustom(280, 54, ref.watch(Auth).when(
                                  data:(_)=>Text(Register,style: TextStyle(fontFamily:"Josefin Sans", fontSize: 30,color: lightYellow),),
                                  error: (error, _) => Text('Error: $error'),
                                  loading:()=>CupertinoActivityIndicator(color: lightYellow,))
                                  ,brown, lightYellow, () async{
                                    formKey.currentState!.save();
                                    UserEntity user=UserEntity(  firstName: firstName.text, lastName: lastName.text,email: email.text,gender: gender.text,age: int.parse(age.text),yourStudy: yourStudy.text);
                                    ref.read(Auth.notifier).register(user).then((value) => Navigator.pushNamed(context, '/AllForms'));
                                  }
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}


