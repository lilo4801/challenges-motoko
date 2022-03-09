import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Option "mo:base/Option";


actor {
    private func swap(array : [var Nat],i : Nat,j : Nat ) :  [var Nat] {
        var temp  = array[i];
        array[i] := array[j];
        array[j] := temp;

        return array;
  };
  public func init_count(n : Nat) :  async [Nat] {

        if( n == 0 ) {
            let arrayNew : [Nat] = [];
            return arrayNew;
        };
        var array : [var Nat ] = Array.init<Nat>(n,0);
        for(i in Iter.range(1,n-1)){
            array[i] := i;
        };
        return Array.freeze(array);
  };
  public func seven(array : [Nat]) :  async Text {

        for(i in array.vals()) {
            if( i == 7){
                return "Seven is found";
            };
            var n = i;
            while(n > 0 ){
                var digit = n % 10;
                if(digit == 7) {
                    return "Seven is found";
                };
                n := n / 10;
            };
            
        };
        return "Seven not found";
  };
    public func nat_opt_to_nat(n : ?Nat,m : Nat) :  async Nat {
        switch(n){
                // Case where n is null
                case(null) {
                    return m;
                };
                // Case where n is a nat
                case(?something){
                    return Option.unwrap(n);
                };
            };
    };
    public func day_of_the_week(n : Nat) :  async ?Text {
        switch(n){
                case(1) {
                    return ?"Monday";
                };
                case(2){
                    return ?"Tuesday";
                };
                case(3){
                    return ?"Wednesday";
                };
                case(4){
                    return ?"Thurday";
                };
                case(5){
                    return ?"Friday";
                };
                case(6){
                    return ?"Suturday";
                };
                case(7){
                    return ?"Sunday";
                };
                case _ {
                    return null;
                };

        };
    };
    func _null_or_nat(n : ?Nat) :  Nat {
        switch(n){
            // Case where n is null
            case(null) {
                return 0;
            };
            // Case where n is a nat
            case(?something){
                return Option.unwrap(n);
            };
        };
    };
   public func populate_array(array : [?Nat]) :  async [Nat] {
       
       return  Array.map(array, func (value : ?Nat) : Nat {
            return _null_or_nat(value);
        });
    
   };
    let f = func (m : Nat,n : Nat) : Nat {
        return m + n;
    };
    public func sum_of_array(array : [Nat]) : async Nat {
        var sum = 0;
        return(Array.foldLeft<Nat,Nat>(array,sum,f));
    };
    let newf1 = func (n : Nat) : Nat {
        return n*n;
    };
    public func squared_array(array : [Nat]) : async [Nat] {
        
        return(Array.map<Nat,Nat>(array,newf1));
    };
    let newf2 = func (n : Nat,index :Nat) : Nat {

        return n+index;
    };
    public func increase_by_index(array : [Nat]) : async [Nat] {
        
        return(Array.mapEntries<Nat,Nat>(array,newf2));
    };
    let newf3 = func (m : Nat,n :Nat) : Bool {

        return m == n;
    };
    func contains<T>(array : [T],a : T,f : (T,T) -> Bool) : Bool {
        let size = array.size();
        var i = 0;
        
        while (i < size) {
            if(f(array[i], a) == true) {
                return true;
            };
            i += 1;
        };
        return false;
    };

      public func chall10(array : [Nat]) : async Bool {
        
        return contains<Nat>(array,2,newf3);
    };
}