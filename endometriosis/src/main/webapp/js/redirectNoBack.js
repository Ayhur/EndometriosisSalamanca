window.onload = function () {
    if (typeof history.pushState === "function") {
        history.pushState("jibberish", null, null);
        window.onpopstate = function () {
            history.pushState('newjibberish', null, null);
            // Handle the back (or forward) buttons here
            // Will NOT handle refresh, use onbeforeunload for this.
        };
    }
    else {
        var ignoreHashChange = true;
        window.onhashchange = function () {
            if (!ignoreHashChange) {
                ignoreHashChange = true;
                window.location.hash = Math.random();
                // Detect and redirect change here
                // Works in older FF and IE9
                // * it does mess with your hash symbol (anchor?) pound sign
                // delimiter on the end of the URL
            }
            else {
                ignoreHashChange = false;   
            }
        };
    }
}




//window.onload = function() {
//	if (typeof history.pushState === "function") {
//		history.pushState("jibberish", null, null);
//		window.onpopstate = function() {
//			history.pushState('newjibberish', null, null);
//			var url = "menu.jsp";    
//			$(location).attr('href',url);
//		};
//	} else {
//		var ignoreHashChange = true;
//		window.onhashchange = function() {
//			if (!ignoreHashChange) {
//				ignoreHashChange = true;
//				window.location.hash = Math.random();
//				console.log("asdsad");
//				// Detect and redirect change here
//				// Works in older FF and IE9
//				// * it does mess with your hash symbol (anchor?) pound sign
//				// delimiter on the end of the URL
//			} else {
//				ignoreHashChange = false;
//				console.log("asdsad");
//			}
//		};
//	}
//}

// assign(): carga la URL que indiquemos como parámetro.
// reload(): recarga la URL actual.
// replace(): carga la URL que indiquemos como parámetro, sin reemplazar en el
// historial de navegación a la que había sido cargada previamente.

// window.addEventListener('popstate', function(event) {
// // The popstate event is fired each time when the current history entry
// changes.
// console.log("ENTRO JS");
// var r = confirm("You pressed a Back button! Are you sure?!");
//
// if (r == true) {
// // Call Back button programmatically as per user confirmation.
// history.back();
// // Uncomment below line to redirect to the previous page instead.
// // window.location = document.referrer // Note: IE11 is not supporting this.
// } else {
// // Stay on the current page.
// history.pushState(null, null, window.location.pathname);
// }
//
// history.pushState(null, null, window.location.pathname);
//
// }, false);

//
// window.onbeforeunload = function() {
// return "¿Estás seguro que deseas salir de la actual página?"
// }

// function deshabilitaRetroceso(){
// window.location.hash="no-back-button";
// window.location.hash="Again-No-back-button" //chrome
// window.onhashchange=function(){window.location.hash="no-back-button";}
// }

// <body onload="deshabilitaRetroceso()">.....</body>

// ESTO SERIA PARA ANGULAR
// myApp.run(function($rootScope, $route, $location){
// //Bind the `$locationChangeSuccess` event on the rootScope, so that we dont
// need to
// //bind in induvidual controllers.
//
// $rootScope.$on('$locationChangeSuccess', function() {
// $rootScope.actualLocation = $location.path();
// });
//
// $rootScope.$watch(function () {return $location.path()}, function
// (newLocation, oldLocation) {
// if($rootScope.actualLocation === newLocation) {
// alert('Why did you use history back?');
// }
// });
// });

//
// However, if you want to make it work with 'normal' urls (without hash I
// guess), you could compare absolute path, instead of the one returned by
// $location.path():
//
// myApp.run(function($rootScope, $route, $location){
// //Bind the `$locationChangeSuccess` event on the rootScope, so that we dont
// need to
// //bind in induvidual controllers.
//
// $rootScope.$on('$locationChangeSuccess', function() {
// $rootScope.actualLocation = $location.absUrl();
// });
//
// $rootScope.$watch(function () {return $location.absUrl()}, function
// (newLocation, oldLocation) {
// if($rootScope.actualLocation === newLocation) {
// alert('Why did you use history back?');
// }
// });
// });

