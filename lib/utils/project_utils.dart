class ProjectUtils {
  final String name;
  final String description;
  final String image;
  final String? playstoreLink;

  ProjectUtils(
      {required this.name,
      required this.description,
      required this.image,
      required this.playstoreLink});
}

List<ProjectUtils>  projectutils=[
  ProjectUtils(name: "Brain Booster: Focus & Relax",
      description: "Brain Booster is an audio app with binaural beats and calming music to improve focus, clarity, and relaxation. Ideal for meditation, studying, or stress relief, it offers customizable playlists and a helpful FAQ section. Download now on the Google Play Store!",
      image: 'assets/projects/brainboosterfocusandrelaxbg.jpg',
      playstoreLink: "https://play.google.com/store/apps/details?id=com.mysteriouscoder.brainbooster"),

  ProjectUtils(name: "Classic Winged Bird",
      description: "Classic Winged Bird is a fun and addictive game featuring classic Flappy Bird gameplay. Navigate through obstacles while unlocking various bird characters and dynamic backgrounds. Enjoy easy tap controls and a high-score challenge, all available on the Play Store!",
      image: 'assets/projects/classicwingedbirdbg.jpg',
      playstoreLink: "https://play.google.com/store/apps/details?id=com.mysteriouscoder.classicwingedbird"),

  ProjectUtils(name: "Hindi Shayari Hub",
      description: "Explore the best Hindi Shayari with Hindi Shayari Hub! Discover Shayari for love, friendship, sadness, and more. Easily share your favorite Shayari with friends. Enjoy a simple design and growing categories. Available now on the Google Play Store for all Shayari lovers!",
      image: 'assets/projects/hindishayarihubbg.jpg',
      playstoreLink: "https://play.google.com/store/apps/details?id=com.mysteriouscoder.hindishayarihub"),

  ProjectUtils(name: "Mazedar Hindi Jokes",
      description: "Mazedar Hindi Jokes is a fun app packed with hilarious Hindi jokes to brighten your day. From witty one-liners to laugh-out-loud stories, enjoy endless entertainment. Easily share jokes with friends and family. Download now on the Google Play Store for daily laughter!",
      image: 'assets/projects/mazedarhindijokesbg.jpg',
      playstoreLink: "https://play.google.com/store/apps/details?id=com.mysteriouscoder.mazedarhindijokes"),

  ProjectUtils(name: "NoteMaster: Offline Organizer",
      description: "NoteMaster: Offline Organizer is your go-to app for organizing notes, tasks, and ideas without needing an internet connection. Perfect for managing to-do lists, reminders, and important thoughts. Stay organized anytime, anywhere. Download now on the Google Play Store!",
      image: 'assets/projects/notemasterbg.jpg',
      playstoreLink: "https://play.google.com/store/apps/details?id=com.mysteriouscoder.notemaster"),


];