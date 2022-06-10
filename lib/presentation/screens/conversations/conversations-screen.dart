import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:mini_chat/presentation/resources/font-manager.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/resources/styles-manager.dart';
import 'package:mini_chat/presentation/resources/values-manager.dart';
import 'package:mini_chat/presentation/screens/conversations/components/message-bar.dart';
import 'package:mini_chat/presentation/screens/conversations/view-model/view-model-class.dart';
import 'package:mini_chat/presentation/screens/home/view-model-class.dart';
class ConversationsPage extends StatefulWidget {
  final String id;
  const ConversationsPage({Key key, this.id}) : super(key: key);

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  TextEditingController textEditingController = TextEditingController();
  ConversationsListHomeViewModel listHomeViewModel = ConversationsListHomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        appBar:AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            AppStrings.home,
            style: getBoldStyle(
                color: Colors.white,
                fontSize: FontSize.s18
            ),
          ),
        ),
        body: FutureBuilder(
          future: listHomeViewModel.fetchConversationDetails(widget.id),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else{
              return SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: AppMargin.m56,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: AppPadding.p12, horizontal: AppPadding.p12),
                          shrinkWrap: true,
                          itemCount: listHomeViewModel.conversationDetailsList.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (){

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
                                  listHomeViewModel.conversationDetailsList[index].conversationsDetails.message,
                                  style: getRegularStyle(
                                      color: Colors.white,
                                      fontSize: FontSize.s16
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom:  AppMargin.m20,
                      child:Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                              vertical: AppPadding.p8),
                          child: MessageBar(
                            searchController: textEditingController,
                            onPressed: () async {
                              textEditingController.clear();
                              //sendMessage();
                            },
                            hintText: "Send a message",
                            fillColor: ColorManager.primary,
                          )),
                    ),
                  ],
                ),
              );
            }
          },

        )
    );
  }
}
