class CoursData {
  late String cTitle;
  late String author;
  late String description;
  late String? courtDescription;
  late String vignette;
  late bool? statut = false;
  late String? comment;
  late String? section;
  late String categorie;
  late String? rating;

  CoursData({
    required this.cTitle,
    required this.author,
    required this.description,
    this.courtDescription,
    required this.vignette,
    this.statut,
    this.comment,
    this.section,
    this.rating,
    required this.categorie,
  });

  Map<String, dynamic> toJson() => {
    'titre' : cTitle,
    'description' : description,
    'categorie' : categorie,
   'Cphoto' : vignette,
   'rating' : rating,
  };

  CoursData.fromSnapshot(snapshot)
      : cTitle = snapshot.data()['titre'],
        description = snapshot.data()['description'],
        categorie = snapshot.data()['categorie'],
        author = snapshot.data()['author'],
        vignette = snapshot.data()['Cphoto'],
        rating = snapshot.data()['rating'].toString();
}
