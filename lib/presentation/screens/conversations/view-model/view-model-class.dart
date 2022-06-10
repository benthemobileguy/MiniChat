import 'package:mini_chat/data/network/conversations-service.dart';
import 'package:mini_chat/presentation/screens/conversations/view-model/conversations-view-model.dart';

class ConversationsListHomeViewModel {
  List<ConversationsViewModel> conversationDetailsList;

  Future<void> fetchConversationDetails(String id) async {
    ConversationsService conversationsService  = ConversationsService();
    final apiResult = await conversationsService.fetchConversationDetails(id);
    conversationDetailsList = apiResult.map((e) => ConversationsViewModel(e)).toList();
  }
}
