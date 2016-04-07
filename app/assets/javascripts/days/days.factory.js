"use strict";

(function(){
  angular
    .module( "days" )
    .factory( "DayFactory", [
      "$resource",
      DayFactoryFunction
    ]);

  function DayFactoryFunction($resource){
    console.log("working?");
    return $resource( "/days.json" );
    }
}());
