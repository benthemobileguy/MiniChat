import 'package:mini_chat/data/network/conversations-service.dart';
import 'package:mini_chat/presentation/screens/home/view-model/home-view-model.dart';

class ListHomeViewModel {
  List<HomeViewModel> conversationList;

  Future<void> fetchConversations() async {
    ConversationsService conversationsService  = ConversationsService();
    final apiResult = await conversationsService.fetchConversations();
    conversationList = apiResult.map((e) => HomeViewModel(e)).toList();
  }
}
