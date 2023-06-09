import 'dart:convert';

class LeafletSection {
  final String title;
  final List<String> paragraphs;

  LeafletSection({required this.title, required this.paragraphs});

  factory LeafletSection.fromJson(Map<String, dynamic> json) {
    return LeafletSection(
      title: json['title'],
      paragraphs: List<String>.from(json['paragraphs']),
    );
  }
}

List<LeafletSection> parseLeaflet(String leafletJson) {
  List<dynamic> jsonList = json.decode(leafletJson);
  List<LeafletSection> leafletSections = jsonList.map((i) => LeafletSection.fromJson(i)).toList();

  for (LeafletSection section in leafletSections) {
    print('Title: ${section.title}');
    print('Paragraphs: ${section.paragraphs.join('\n')}');
  }

  return leafletSections;
}