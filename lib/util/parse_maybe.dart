num parseMaybe<T extends num>(dynamic val){
  if(val.runtimeType != String) return val;
  final ans = num.parse(val);
  if(T == double) return ans.toDouble();
  return ans;
}