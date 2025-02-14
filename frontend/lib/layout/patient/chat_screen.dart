import 'package:flutter/material.dart';
import 'package:medicare/provider/providers.dart';
import 'package:medicare/temporary/models/models.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
    final ScrollController _scrollController = ScrollController();
      final TextEditingController _messageController = TextEditingController();

 void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Consumer<ChatProvider>(
                  builder: (BuildContext context, ChatProvider value,
                      Widget? child) {
                    final List<ChatMessage> messages = value.messages;
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(Icons.support_agent, color: Colors.blue),
                              SizedBox(width: 8),
                              Text(
                                'Healthcare Assistant',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return _buildMessage(messages[index]);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                    controller: _messageController,
                                    decoration: InputDecoration(
                                      hintText: 'Type your message...',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                    ),
                                    onSubmitted: (_) {
                                      if (_messageController.text.isNotEmpty) {
                                        final ChatProvider chatprovider =
                                            context.read<ChatProvider>();
                                        chatprovider.sendMessage(
                                            _messageController.text);

                                        _messageController.clear();
                                        Future.delayed(
                                            Duration.zero, _scrollToBottom);
                                      }
                                    }),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.send),
                                color: Colors.blue,
                                onPressed: () {
                                  if (_messageController.text.isNotEmpty) {
                                    final ChatProvider chatprovider =
                                        context.read<ChatProvider>();
                                    chatprovider
                                        .sendMessage(_messageController.text);

                                    _messageController.clear();
                                    Future.delayed(
                                        Duration.zero, _scrollToBottom);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ) ,),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}


