flutter pub run pigeon \
  --input pigeons/book.dart \
  --dart_out lib/messages.dart \
  --objc_header_out ios/Classes/messages.h \
  --objc_source_out ios/Classes/messages.m \
  --objc_prefix FLT \
  --java_out ./android/app/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "io.flutter.plugins"