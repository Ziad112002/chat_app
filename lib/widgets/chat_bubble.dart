import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
   const ChatBubble(
       {
         required this.message,
         super.key,
  });
  final Message message;
   @override
  Widget build(BuildContext context) {
    return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin:const  EdgeInsets.all(5),
              padding: const EdgeInsets.only(top:15,bottom: 15,right: 10,left: 10),
              decoration:  const BoxDecoration(
                  color:kPrimaryColor,
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),
                child:  Text(
                    message.message,
                style: const TextStyle(
                  color: Colors.white
                ),),
            ),
          );

  }
}
class ChatBubbleforFriend extends StatelessWidget {
  const ChatBubbleforFriend(
      {
        required this.message,
        super.key,
      });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin:const  EdgeInsets.all(5),
        padding: const EdgeInsets.only(top:15,bottom: 15,right: 10,left: 10),
        decoration:  const BoxDecoration(
            color:Color(0xff006d84),
            borderRadius:  BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
        ),
        child:  Text(
          message.message,
          style: const TextStyle(
              color: Colors.white
          ),),
      ),
    );

  }
}


