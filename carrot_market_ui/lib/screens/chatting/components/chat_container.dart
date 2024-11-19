import 'package:carrot_market_ui/components/image_container.dart';
import 'package:carrot_market_ui/model/chatMessage.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final ChatMessage chatMessage;

  const ChatContainer({required this.chatMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ImageContainer(
              borderRadius: 25,
              imageUrl: chatMessage.profileImage,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: chatMessage.sender,
                        style: TextStyle(fontSize: 14),
                      ),
                      TextSpan(
                        text: chatMessage.location,
                        style: TextStyle(fontSize: 12),
                      ),
                      TextSpan(
                        text: ' • ${chatMessage.sendDate}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ]),
                  ),
                  Text(chatMessage.message, overflow: TextOverflow.ellipsis,),
                  const Spacer(),
                ],
              ),
            ),
            /// 이미지 추가
            Visibility(
                visible: chatMessage.imageUri != null,
                child: ImageContainer(
              width: 50,
              height: 50,
              borderRadius: 8,
              imageUrl: chatMessage.imageUri ?? '',
            ))
          ],
        ),
      ),
    );
  }
}
