import List "mo:base/List";
import Array "mo:base/Array";
module {
    public type List<T> = ?(T, List<T>);

    public func is_null<T>(l : List<T>) :  Bool {
        switch(l){
            case(null) {
                return true;
            };
            case(?l){
                return false;
            };
        }
    };
    public func last<T>(l : List<T>) :  ?T {
        var array : [T] = List.toArray<T>(l);
        var size : Nat = array.size();
        if(size == 0) {
            return null;
        };
        return ?array[size-1];
    };

     public func size<T>(l : List<T>) :  Nat {
        var array : [T] = List.toArray<T>(l);
        var size : Nat = array.size();
        if(size == 0) {
            return 0;
        };
        return size;
    };
     public func get<T>(l : List<T>,n : Nat) :  ?T {
        var array : [T] = List.toArray<T>(l);
        var size : Nat = array.size();
        if(size <= n ) {
            return null;
        };
        return ?array[n];
    };
   


}