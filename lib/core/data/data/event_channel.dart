class ChannelEvent {
  const ChannelEvent({
    required this.name,
    required this.data,
  });

  final String name;
  final dynamic data;

  factory ChannelEvent.fromMap(Map<dynamic, dynamic> map) => ChannelEvent(
        name: map["name"],
        data: map["data"],
      );
}
