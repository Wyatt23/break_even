"use strict";

(function(){
  angular
    .module( "exercises" )
    .factory( "ExerciseFactory", [
      "$resource",
      ExerciseFactoryFunction
    ]);

  function ExerciseFactoryFunction($resource){
    console.log("I'm a factory");
    return $resource( "/exercises/:id.json" );
    }
}());
