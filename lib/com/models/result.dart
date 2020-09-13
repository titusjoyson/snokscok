class Rec {
  double x;
  double y;
  double w;
  double h;

  Rec(this.x, this.y, this.w, this.h);
}

class Result {
  double confidenceInClass;
  String detectedClass;

  Rec rec;

  Result(this.confidenceInClass, this.detectedClass, this.rec);
}
