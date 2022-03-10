import Coder "custom";
import Animal "animal";
import List "mo:base/List";
import NewList "list";
actor {
    public type Coder = Coder.Coder;
    public type Animal = Animal.Animal;
    public type List<Animal> = ?(Animal, List<Animal>);
     //1
    public func showInfo() : async Coder {
        var  coder : Coder = {
            name = "Me";
            numberOfBug = 1000;
        };
        return coder;
    };
    //2
    let animal : Animal = {
        specie = "??";
        energy = 10;
    };
    // 3 check
   

    // 4
     public func create_animal_then_takes_a_break(specie : Text,energy : Nat) : async Animal {
        let animal : Animal = {
            specie = specie;
            energy = energy;
        };
        return Animal.animal_sleep(animal);
    };
    // 5 
    var listAnimal : List<Animal> = List.nil<Animal>();
    public func push_animal(animal : Animal)  {
        
       listAnimal :=  List.push<Animal>(animal,listAnimal);

    };
    //6 
    public func get_animals() : async [Animal] {
       return List.toArray(listAnimal);
    };
   
};