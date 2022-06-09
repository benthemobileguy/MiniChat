import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:mini_chat/data/network/conversations-service.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/screens/home/home-viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConversationsService conversationsService = new ConversationsService();
  ListHomeViewModel listHomeViewModel = ListHomeViewModel();
  @override

  Widget build(BuildContext context) {
    conversationsService.fetchConversations();
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: FutureBuilder(
        future: listHomeViewModel.fetchConversations(),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else{
          return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index){
                return Bubble(
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  margin: const BubbleEdges.symmetric(vertical: 8, horizontal: 10),
                  padding: const BubbleEdges.all(10),
                  alignment: Alignment.center,
                  nip: BubbleNip.no,
                  color: ColorManager.primary,
                  child: const Text(
                    "Conversation",

                  ),
                );
              });
        }
        },

      )
    );
  }
}

