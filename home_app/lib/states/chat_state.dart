import 'package:home_app/model/chat_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Chat> chats;

  ChatLoaded(this.chats);
}

class SingleChatLoaded extends ChatState {
  final Chat chat;
  final String error;

  SingleChatLoaded(this.chat, this.error);
}

class SingleChatLoading extends ChatState {
  final Chat chat;

  SingleChatLoading(this.chat);
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}
