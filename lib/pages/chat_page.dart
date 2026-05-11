import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
    ChatPage({super.key});
 static String id='ChatPage';
   CollectionReference messages=
   FirebaseFirestore.instance.collection(knameCollection);
   TextEditingController controller=TextEditingController();
   final _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages. orderBy(kCreatedAt,descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          List<Message>messageList=[];
          for(int i=0;i<snapshot.data!.docs.length;i++){
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));

          }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/scholar.png', width: 50,),
                    const Text('Chat',style: TextStyle(color: Colors.white),)
                  ],
                ),

              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int i) {
                          return messageList[i].id==email?  ChatBubble(
                          message: messageList[i],
                          ):ChatBubbleforFriend(message: messageList[i]);
                        },
                      ),
                    ),
                    TextField(
                      controller: controller,
                      onSubmitted: (data){
                        messages.add({
                          kMessage:data,
                          kCreatedAt:DateTime.now(),
                          'id':email
                        });
                        controller.clear();
                        _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn
                        );

                      },
                      style: const TextStyle(
                          color: kPrimaryColor
                      ),
                      decoration:  InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:const  BorderSide(
                                  color: kPrimaryColor,
                                  width: 2
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:const  BorderSide(
                                  color: kPrimaryColor,
                                  width: 2
                              )
                          ),
                          suffixIcon: const Icon(
                            Icons.send,color: kPrimaryColor,size: 30,
                          ),
                          hintText: 'send messages '
                      ),
                    )
                  ],
                ),
              ),

            );
          }
          else{
            return const Text('loading.....');
          }
            }
    );
  }
}

