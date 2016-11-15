ymaps.ready(init);
var myMap;
var myPlacemark;
function init() {
    myMap = new ymaps.Map("map", {
        center: [51.534515032989255, 46.031469342303424], // Саратов
        zoom: 11,
        controls: ['zoomControl']
    }, {
        balloonMaxWidth: 200,
        searchControlProvider: 'yandex#search'
    });
    myPlacemark = new ymaps.Placemark([51.534515032989255, 46.031469342303424]);
    myMap.geoObjects.add(myPlacemark);
    myMap.events.add('click', function (e) {
        myMap.geoObjects.remove(myPlacemark);
        myPlacemark = new ymaps.Placemark(e.get('coords'));
        $('#mapCoordsInput')[0].value=e.get('coords');
        myMap.geoObjects.add(myPlacemark);
    });

}