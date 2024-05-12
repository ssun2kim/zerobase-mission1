function accessToGeo(position) {
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);

    let lat = document.getElementById('lat').value = position.coords.latitude;
    let lnt = document.getElementById('lnt').value = position.coords.longitude;
}

function askForLocation() {
    navigator.geolocation.getCurrentPosition(accessToGeo);
}

window.onload = function () {
        document.getElementById('curPosBtn').addEventListener('click', function (event) {
        askForLocation();
    });
};



