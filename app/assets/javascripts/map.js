var marker;
var handler;
var mapStyle = [

  {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 13
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#144b53"
            },
            {
                "lightness": 14
            },
            {
                "weight": 1.4
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#08304b"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#0c4152"
            },
            {
                "lightness": 5
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#0b434f"
            },
            {
                "lightness": 25
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#0b3d51"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "color": "#146474"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#021019"
            }
        ]
    }


];

function initMap(){
  marker;
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'},
   provider: {
        zoom:      15,
        center:    new google.maps.LatLng(4.635487, -74.082719),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles:    mapStyle
      }


  }, function(){

      marker = handler.addMarker({
        lat: document.getElementById('barter_latitude').value ,
        lng: document.getElementById('barter_longitude').value
      });
      handler.map.centerOn(marker);
  });

  function displayOnMap(position){
    marker = handler.addMarker({
      lat: position.coords.latitude,
      lng: position.coords.longitude
    });
    handler.map.centerOn(marker);


  };

  google.maps.event.addListener(handler.getMap(), "click", function(evt) {
    handler.removeMarker(marker);
    document.getElementById('barter_latitude').value = evt.latLng.lat();
    document.getElementById('barter_longitude').value = evt.latLng.lng();
    marker = handler.addMarker({
      lat: evt.latLng.lat(),
      lng: evt.latLng.lng()
    });
    handler.map.centerOn(marker);
    evt.stop();
  });
}

function initMapStatic(){

  marker;
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'mapStatic'},
   provider: {
        zoom:      15,
        center:    new google.maps.LatLng(4.635487, -74.082719),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles:    mapStyle
      }


  }, function(){

      marker = handler.addMarker({
        lat: document.getElementById('barter_latitude_static').value ,
        lng: document.getElementById('barter_longitude_static').value
      });
      handler.map.centerOn(marker);
  });
}
