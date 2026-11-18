import 'dart:math';

class Vector3D {
  final double x;
  final double y;
  final double z;

  const Vector3D(this.x, this.y, [this.z = 0.0]);

  Vector3D operator +(Vector3D other) =>
      Vector3D(x + other.x, y + other.y, z + other.z);
  Vector3D operator -(Vector3D other) =>
      Vector3D(x - other.x, y - other.y, z - other.z);

  double get magnitude => sqrt(x * x + y * y + z * z);

  double dot(Vector3D other) => (x * other.x) + (y * other.y) + (z * other.z);

  double angleWith(Vector3D other) {
    double magProduct = magnitude * other.magnitude;
    if (magProduct == 0) return 0.0;
    double cosTheta = dot(other) / magProduct;
    return acos(cosTheta.clamp(-1.0, 1.0)) * (180 / pi);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vector3D && x == other.x && y == other.y && z == other.z;

  @override
  int get hashCode => Object.hash(x, y, z);

  @override
  String toString() =>
      '(${x.toStringAsFixed(1)}, ${y.toStringAsFixed(1)}, ${z.toStringAsFixed(1)})';
}
