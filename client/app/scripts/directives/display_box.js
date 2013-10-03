"use strict";
angular.module('ShadowWolf')
.directive("displayBox", function() {
    var editorTemplate = 
        '<div class="demo col-xs-6 col-sm-4 col-md-4 col-lg-3">                   '+  //TODO pass these in as an arg
        '  <img src="http://placekitten.com/g/5/5" class="square">                '+  //TODO find a way around this
        '  <div class="info-box"                                                  '+
        '       ng-mouseenter="setDrawerState(\'drawer-out\')"                    '+
        '       ng-mouseleave="setDrawerState(\'drawer-in\')"                     '+
        '       ng-click     ="setDrawerState(\'click\')">                        '+
        '    <img src="{{imgSrc}}" class="box-image">                             '+//http://placekitten.com/g/200/200
        '    <div class="details {{state}}">                                      '+
        '      <h1 class="title title-{{state}}">{{titleText}}</h1>               '+
        '      <p><a class="btn btn-info info-button" href="{{moreLink}}">more</a> '+
        '        {{bodyText}}</p>                                                 '+
        '    </div>                                                               '+
        '  </div>                                                                 '+
        '</div>                                                                   ';

    return {
        restrict: "E",
        replace: true,
        template: editorTemplate,
        scope: {
          titleText: "@",
          bodyText:  "@",
          imgSrc:    "@",
          moreLink:  "@"
        },
        link: function (scope, element, attrs) {}, 
        controller: function($scope) {
            $scope.state = "drawer-in";
            $scope.setDrawerState=function(state){
              if(state!='click'){
                $scope.state = state; 
              }
              else if($scope.state == 'drawer-in'){
                $scope.state = 'drawer-out'; 
              }
              else if($scope.state == 'drawer-out'){
                 $scope.state = 'drawer-in'; 
              }
            };
        }
    };
});