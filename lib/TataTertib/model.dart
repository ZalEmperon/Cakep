class tata_tertib{
  final String id;
  final String indikator;
  final String poin;
  final String aspek;

  tata_tertib({required this.id, required this.indikator, required this.poin, required this.aspek});

  Map<String,dynamic> toMap(){
    return{
      'id' : id,
      'indikator' : indikator,
      'poin' : poin,
      'aspek' : aspek
    };
  }
}