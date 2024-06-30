flutter run -d chrome --web-browser-flag "--disable-web-security"

// web
# add on web/index.html
  <script>
    window.flutterWebRenderer = "html";
  </script>
# running
flutter run -d chrome 
flutter run -d chrome --web-renderer canvaskit --> font css bagus, gak bisa cors
flutter run -d chrome --web-renderer html --> bisa cors, gak bisa baca font
# build
flutter build web --release  
flutter build web --web-renderer canvaskit --release
flutter build web --web-renderer html --release