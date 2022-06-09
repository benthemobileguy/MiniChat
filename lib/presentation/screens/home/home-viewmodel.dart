import 'package:mini_chat/data/network/conversations-service.dart';
import 'package:mini_chat/domain/model/conversation.dart';

class ListHomeViewModel {
  List<HomeViewModel> conversationList;

  Future<void> fetchConversations() async {
    ConversationsService conversationsService  = ConversationsService();
    final apiResult = await conversationsService.fetchConversations();
    conversationList = apiResult.map((e) => HomeViewModel(e)).toList();

  }
}
class HomeViewModel {
    final Conversation conversation;

  HomeViewModel(this.conversation);

}