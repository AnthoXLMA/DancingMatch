// var cats = [];
// for (var i = 0; i < geojson.length; i++) {
//     var cat = getCat(cats, geojson[i].properties.categorie2);
//     if (cat === undefined) {
//         cat = {
//             "interestPoints" : createInterestPoints(),
//             "id" : "cat" + i,
//             "label" : geojson[i].properties.categorie2
//         }
//         cats.push(cat);
//     }
//     cat["interestPoints"].addData(geojson[i]);
// }

function createInterestPoints () {
    return new L.geoJson([], {
        pointToLayer: function(feature, latlng) {
            var smallIcon = L.icon({
                iconUrl: "maps/interest-point/" + /*icon-provider.js*/getIcon(feature.properties.categorie1, feature.properties.categorie2, feature.properties.categorie3),
                //shadowUrl: 'icon-shadow.png',
                iconSize:     [33, 44], // taille de l'icone
                //shadowSize:   [50, 64], // taille de l'ombre
                iconAnchor:   [16, 44], // point de l'icone qui correspondra à la position du marker
                //shadowAnchor: [32, 64],  // idem pour l'ombre
                popupAnchor:  [-3, -76] // point depuis lequel la popup doit s'ouvrir relativement à l'iconAnchor
            });
            return L.marker(latlng, {icon: smallIcon});
        },
        onEachFeature: function(feature, layer) {
            var html = '';
            if (feature.properties.titre) {
                html += '<b>' + feature.properties.titre + '</b></br>';
            }
            if (feature.properties.description) {
                html += 'Description :' + feature.properties.description + '</br>';
            }
            if (feature.properties.url) {
                html += '<a href="' + feature.properties.url + '" target="_blank">Site Internet</a></br>';
            }
            if (feature.properties.categorie1) {
                html += 'Catégorie 1 : ' + feature.properties.categorie1 + '</br>';
            }
            if (feature.properties.categorie2) {
                html += 'Catégorie 2 : ' + feature.properties.categorie2 + '</br>';
            }
            if (feature.properties.categorie3) {
                html += 'Catégorie 3 : ' + feature.properties.categorie3 + '</br>';
            }
            layer.bindPopup(html);
        }
    });
}

export { createInterestPoints } ;
// export { cats } ;
