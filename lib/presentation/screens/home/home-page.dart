import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:mini_chat/data/network/conversations-service.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/resources/font-manager.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/resources/styles-manager.dart';
import 'package:mini_chat/presentation/resources/values-manager.dart';
import 'package:mini_chat/presentation/screens/conversations/conversations-screen.dart';
import 'package:mini_chat/presentation/screens/home/view-model-class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConversationsService conversationsService = ConversationsService();
  ListHomeViewModel listHomeViewModel = ListHomeViewModel();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar:AppBar(
        leading: Container(),
        title: Text(
         AppStrings.home,
          style: getBoldStyle(
              color: Colors.white,
              fontSize: FontSize.s18
          ),
        ),
      ),
      body: FutureBuilder(
        future: listHomeViewModel.fetchConversations(),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else{
          return Center(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p12, horizontal: AppPadding.p12),
              shrinkWrap: true,
                itemCount: listHomeViewModel.conversationList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                               ConversationsPage(
                                 id: listHomeViewModel.conversationList[index].conversation.id)
                          ));
                    },
                    child: Bubble(
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      margin: const BubbleEdges.symmetric(vertical: FontSize.s12, horizontal: FontSize.s12),
                      padding: const BubbleEdges.all(FontSize.s12),
                      alignment: Alignment.center,
                      nip: BubbleNip.rightTop,
                      color: ColorManager.primary,
                      child: Text(
                        listHomeViewModel.conversationList[index].conversation.lastMessage,
                        style: getRegularStyle(
                          color: Colors.white,
                          fontSize: FontSize.s16
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        },

      )
    );
  }
}

