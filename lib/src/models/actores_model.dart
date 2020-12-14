//instancia la clase actores
// modelo para tener inormacion de todos los actores
class Cast {
  List<Actor> actores = new List();
  Cast();
  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      print("==========no se puede traer los datos=============");
      return;
    }

    jsonList.forEach((element) {
      final actor = Actor.fromJsonMap(element);
      actores.add(actor);
    });
  }
}
// fin de metodo

// codigo para traer informacion individualmente d
class Actor {
  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  Department knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  Department department;
  String job;

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    knownForDepartment = json['known_for_department'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['castId'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    job = json['job'];
  }

  getFoto() {
    if (profilePath == null) {
      return 'https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}

// metodo para recibir la informacion

enum Department {
  ACTING,
  CREW,
  COSTUME_MAKE_UP,
  WRITING,
  PRODUCTION,
  SOUND,
  DIRECTING,
  CAMERA,
  LIGHTING,
  ART,
  EDITING,
  VISUAL_EFFECTS
}
