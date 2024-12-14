import Nat32 "mo:base/Nat32";
import Trie "mo:base/Trie";
import List "mo:base/List";
import Text "mo:base/Text";
import Result "mo:base/Result";

actor {
  public type SuperHeroId = Nat32;

  public type SuperHero = {
    name: Text;
    superpowers: List.List<Text>;
  };

  private stable var next : SuperHeroId = 0;

  private stable var superHeroes : Trie.Trie<SuperHeroId, SuperHero> = Trie.empty();

  public func createHero (newHero: SuperHero) : async Nat32{

    let id = next;
    next+=1;
    superHeroes := Trie.replace(
      superHeroes,
      key(id),
      Nat32.equal,
      ?newHero
    ).0;

    return id;
  };

  public func getHeto (id: SuperHeroId) : async ?SuperHero{

    let Result = Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );
    return Result;
  };

  public func updateHero (id: SuperHeroId, newHero: SuperHero): async Bool {

    let Result = Trie.find(
        superheroes,
        key(id),
        Nat32.equal
    );

  let exists = Option.isSome(result);
  if(exists){

    superHeroes:= Trie.replace(
      superHeroes,
      key(id),
      Nat32.equal,
      ?newHero
    ).0;

  };

  exists;
  };

  public func delete (id: SuperHeroId) : async ?SuperHero{

    let Result = Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );

    let exists = Option.isSome(result);
    if(exists){

      superHeroes:= Trie.replace(
        superHeroes,
        key(id),
        Nat32.equal,
        ?newHero
      ).0;

    };

    return Result;
};

  private func key(x:SuperHeroId): Trie.Key<SuperHeroId>{
    (hash = x; key = x);
  };
  
};
