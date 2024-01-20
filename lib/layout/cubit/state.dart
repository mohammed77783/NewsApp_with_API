



abstract class NewsState{}

class Newsinitialstate extends NewsState{}
class NewsBottomNavState extends NewsState{}

class NewsBusinessgState extends NewsState{}
class NewsbreakingLoadingState extends NewsState{}

class NewsgetBusinessSuccessstate extends NewsState{}
 class NewsgetBusinessErrorstate extends NewsState{
     final String error;
  NewsgetBusinessErrorstate(
     this.error,
  );



}



class NewsgetBusinessBreakingSuccessstate extends NewsState{}
 class NewsgetBusinessBreakingErrorstate extends NewsState{
     final String error;
  NewsgetBusinessBreakingErrorstate(
     this.error,
  );


  
}



class NewsgeneralgState extends NewsState{}
class NewsgetgeneralSuccessstate extends NewsState{}
 class NewsgetgeneralErrorstate extends NewsState{
     final String error;
  NewsgetgeneralErrorstate(
     this.error,
  );



}


class NewsgetscienceState extends NewsState{}
class NewsgetscienceSuccessstate extends NewsState{}
 class NewsgetscienceErrorstate extends NewsState{
     final String error;
  NewsgetscienceErrorstate(
     this.error,
  );
}


class NewsgetSportState extends NewsState{}
class NewsgeSportSuccessstate extends NewsState{}
 class NewsgetSportErrorstate extends NewsState{
     final String error;
  NewsgetSportErrorstate(
     this.error,
  );
}


class changthemmodeState extends NewsState{}

