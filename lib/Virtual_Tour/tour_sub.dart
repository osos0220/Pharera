import 'package:flutter/services.dart' show rootBundle;

class Subtitle {
  final Duration start;
  final Duration end;
  final String text;

  Subtitle({
    required this.start,
    required this.end,
    required this.text,
  });
}

Future<List<Subtitle>> loadSubtitles(String languageCode, int panoId) async {
  final String srtContent = await rootBundle.loadString('assets/subtitles/subtitles_${languageCode}_$panoId.srt');
  final List<Subtitle> subtitles = [];

  final List<String> lines = srtContent.split('\n');
  int i = 0;
  while (i < lines.length) {
    final index = int.tryParse(lines[i].trim());
    if (index != null) {
      i++;
      final times = lines[i].trim().split(' --> ');
      final start = _parseDuration(times[0]);
      final end = _parseDuration(times[1]);
      i++;
      final text = StringBuffer();
      while (i < lines.length && lines[i].trim().isNotEmpty) {
        text.write(lines[i].trim() + ' ');
        i++;
      }
      subtitles.add(Subtitle(start: start, end: end, text: text.toString().trim()));
    }
    i++;
  }
  return subtitles;
}


Duration _parseDuration(String time) {
  final parts = time.split(':');
  final secondsParts = parts[2].split(',');
  return Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(secondsParts[0]),
    milliseconds: int.parse(secondsParts[1]),
  );
}
