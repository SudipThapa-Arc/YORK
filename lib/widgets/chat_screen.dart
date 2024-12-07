import 'package:flutter/material.dart';
import 'package:personal_ai_assistant/services/ai_service.dart';
import 'package:personal_ai_assistant/widgets/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });
    
    final aiService = Provider.of<AIService>(context, listen: false);
    final response = await aiService.getResponse(text);
    
    setState(() {
      _messages.insert(0, ChatMessage(text: response, isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) => _messages[index],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isUser ? const SizedBox() : const CircleAvatar(child: Text('AI')),
          const SizedBox(width: 10),
          Flexible(
            child: ChatBubble(
              message: text,
              isUser: isUser,
            ),
          ),
          const SizedBox(width: 10),
          isUser ? const CircleAvatar(child: Text('Me')) : const SizedBox(),
        ],
      ),
    );
  }
}

