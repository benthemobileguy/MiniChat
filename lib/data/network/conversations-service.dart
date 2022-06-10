import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_chat/data/network/network-service.dart';
import 'package:mini_chat/domain/model/conversation-details.dart';
import 'package:mini_chat/domain/model/conversation.dart';

class ConversationsService extends NetworkService{

  Future<List<Conversation>> fetchConversations() async {
    List<dynamic> _data = await get(dotenv.env['API_BASE_URL'], "inbox.json");
    List<Conversation> _conversationList = Conversation.fromJsonList(_data);
    return _conversationList;
  }
  Future<List<ConversationDetails>> fetchConversationDetails(String id) async {
    List<dynamic> _data = await get(dotenv.env['API_BASE_URL'], '$id.json');
    List<ConversationDetails> _conversationList = ConversationDetails.fromJsonList(_data);
    return _conversationList;
  }
}