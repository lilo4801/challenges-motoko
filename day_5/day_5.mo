import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
actor {
    //1
    public shared({caller}) func is_anonymous() : async Bool {
        return Principal.isAnonymous(caller);
    };
    //2
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
    //3
    // public shared ({caller}) func add_favorite_number(n : Nat) : async () {
    //     favoriteNumber.put(caller, n);
    //     return;
    // };
    public shared ({caller}) func show_favorite_number() : async ?Nat {
       return (favoriteNumber.get(caller));
    };
    //4
     public shared ({caller}) func add_favorite_number(n : Nat) : async Text {
         switch(favoriteNumber.get(caller)){
                
                case(null) {
                    favoriteNumber.put(caller, n);
                    return "You've successfully registered your number";
                    
                };
                
                case(?something){
                    return "You've already registered your number";
                };
            };
    };
    //5 
    public shared({caller}) func delete_favorite_number() : async ?Nat {
        return (favoriteNumber.remove(caller));
    };

    public shared({caller}) func update_favorite_number(n :Nat) : async Text {
         switch(favoriteNumber.get(caller)){
                case(null) {
                    return "You've no  your number"; 
                };
                
                case(?something){
                    favoriteNumber.put(caller, n);
                    return "You've successfully updated your number";
                };
            };
    };
    //6 

    //7

    //8
    stable var versionNumber : Nat = 0;

    public func increment_counter(n : Nat) : async Nat {
        versionNumber := versionNumber + n;
        return versionNumber;
    };
    



}