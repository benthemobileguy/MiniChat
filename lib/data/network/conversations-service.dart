import 'package:mini_chat/data/network/network-service.dart';
import 'package:mini_chat/domain/model/conversation.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';

class ConversationsService extends NetworkService{

  /// get symptoms
  Future<List<dynamic>> fetchConversations() async {
    List<dynamic> _data = await get(AppStrings.BASE_URL, "inbox.json");
    List<dynamic> _conversationList = Conversation.fromJsonList(_data);
    return _conversationList;
  }

}