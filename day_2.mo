import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
actor {
 
  public func nat_to_nat8(n : Nat) : async Nat8 {
      if(n <= 255 and n >= 0  ){
        return(Nat8.fromNat(n));
      }else{
        return 0;
      };
      
    };
  public func max_number_with_n_bits(n : Nat) : async Nat {
      var max = 0;
      for(i in Iter.range(0,n-1)) {
          max := max + Nat.pow(2,i);
      };
      return max;
    };
    public func decimal_to_bits(n : Nat) : async Text {
      var max : Nat = 0;
      var num = n;
      while (num > 0) {
            max := max + num % 2;
            
            num := num / 2;
            max := max*10;
        };
      max := max/10;
      return Nat.toText(max);
    };
   
    public func capitalize_character(c : Char) : async Text {
      var cNat32 : Nat32 = Char.toNat32(c);
      if(cNat32 <= 122 and cNat32 >= 97) {
         cNat32 := cNat32 - 32;
      };
      return Char.toText(Char.fromNat32(cNat32))
    };
    
    public func capitalize_text(t : Text) : async Text {
        var newT : Text = "";
        for(i in t.chars()) {
            var cNat32 : Nat32 = Char.toNat32(i);
            if(cNat32 <= 122 and cNat32 >= 97) {
                cNat32 := cNat32 - 32;
            };
            newT := newT # Char.toText(Char.fromNat32(cNat32));
        };
    	return newT;
    };
    public func is_inside(t : Text,c : Char) : async Bool {
        for(i in t.chars()) {
            if(i == c) {return true};
          
        };
    	return false;
    };
    public func trim_whitespace(t : Text) : async Text {
        let p = #text(" ");
        return Text.trim(t,p);
    };
    public func duplicated_character(t : Text) : async Text {
        var count : Nat = 0;
        for (i in t.chars()) { 
            count := 0;
            for (j in t.chars()) {
                if(i==j) { count := count +1;};
                if(count > 1) {
                    return Char.toText(i);
                };
            };
        };
       
        return t;
    };
    public func size_in_bytes(t : Text) : async Nat {
        return t.size();
    };
    public func bubble_sort(array : [Nat]) : async [Nat] {
        var newArray : [var Nat] = Array.thaw(array); 
        var temp = 0;
        
        for (i in Iter.range(0, newArray.size()-1)) { 
            
            for (j in Iter.range(0, newArray.size()-i-2)) {
                if (newArray[j] > newArray[j+1]) {
                        temp := newArray[j]; 
                        newArray[j] := newArray[j+1]; 
                        newArray[j+1] := temp; 
                };
            };
               
        };
     return Array.freeze(newArray);
    };
};