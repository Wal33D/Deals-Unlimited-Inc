//= require jquery
//= require jquery_ujs
//= require_tree .
//////////////////Fundamental Code////////////////////////////////////
//////////////////////////////////////////////////////////////////////


jQuery(document).ready(function($) {
    $(".button-collapse").sideNav();

  $(".dropdown-button").dropdown();

  (function titleScroller(text) {
  document.title = text;
  setTimeout(function () {
  titleScroller(text.substr(1) + text.substr(0, 1));
  }, 500);
  }("Deals Unlimited, Inc. Fine Used Vehicles - 269-324-4285 -  Come See Us Today! - "));
  
    var $window = $('#window');
    var $textarea = $('#contact_message');
    $textarea.height($(window).height() * 0.2);

    try{setTimeout("$('#reselect').fadeOut('slow')", 5000);  } catch (err) {}
    try{setTimeout("$('.alert').fadeOut('slow')", 4000);  } catch (err) {}



});


/////////////////////////To Lower Case////////////////////////////////
//////////////////////////////////////////////////////////////////////
function tLC(string) {
    if (string) {
        return string.toLowerCase();
    } else return " ";
};
/////////////Makes the First letter of a string into a Captial////////
//////////////////////////////////////////////////////////////////////
function cFL(string) {
    if (string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
    } else return " ";
};
//////////////////////////////////////////////////////////////////////
$('#button').click(function() {
    setTimeout(function() {

        var emptyTextBoxes = $('input:empty').filter(function() {
            return this.value == "";
        });
        var string = "The blank textbox ids are - \n";

        emptyTextBoxes.each(function() {

            string += "\n" + this.id;
        });
        var emptyTextBoxes = $('input:empty').filter(function() {
            return this.value == "";
        });
        emptyTextBoxes.css("border", "1px double blue");
        emptyTextBoxes.css("background-color", "#eee");
        var emptyTextBoxes = $('textarea:empty').filter(function() {
            return this.value == "";
        });
        emptyTextBoxes.css("border", "1px double blue");
        emptyTextBoxes.css("background-color", "#eee");

        emptyTextBoxes = $('input:empty').filter(function() {
            return this.value == " ";
        });
        emptyTextBoxes.css("border", "1px double red");
        emptyTextBoxes.css("background-color", "#eee");
        emptyTextBoxes = $('input:empty').filter(function() {
            return this.value == "UNDEFINED";
        });
        emptyTextBoxes.css("border", "1px double orange");
        emptyTextBoxes.val("");

        emptyTextBoxes.css("background-color", "#ddd");

    }, 2500);

});

//////////////////////////////////////////////////////////////////////
function title() {
    var veh_title = document.getElementById('vehicle_title');
    veh_title.value = document.getElementById('vehicle_year').value + " " + document.getElementById('vehicle_make').value + " " + document.getElementById('vehicle_model').value;
};
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function filler(res, title) {
    if ((document.getElementById(title).value == "") || (document.getElementById(title).value == "null") || (document.getElementById(title).value == "UNDEFINED") || (document.getElementById(title).value == "N/A")) {
        var value = document.getElementById(title).value.trim();
        if (res) {
            document.getElementById(title).value = res;
        } else {
            document.getElementById(title).value = "UNDEFINED"
        }
    } else {
        return;
    };
};
/////////////////////EDMUNDS V2 API///////////////////////////////////
//////////////////////////////////////////////////////////////////////
function v2(option, res) {
    var options = {};

    function success(res) {
         try {filler(res.make.name, "vehicle_make");} catch (err) {}
         try {filler(res.model.name, "vehicle_model");} catch (err) {}
         try {filler(res.years[0].year, "vehicle_year");} catch (err) {}
        try {filler(cFL(res.engine.type), "vehicle_fuel_type");} catch (err) {}
        try {filler(res.categories.vehicleStyle, "vehicle_body_style");} catch (err) {}
        try {filler(cFL(res.drivenWheels), "vehicle_drive_type");} catch (err) {}
        try {filler(res.numOfDoors, "vehicle_doors");} catch (err) {}
        try {filler("Highway " + res.MPG.highway, "vehicle_mpg");} catch (err) {}
        try {filler("City " + res.MPG.city, "vehicle_mpg"); } catch (err) {}
        try {if ((res.MPG.city !== "undefined") && (res.MPG.highway !== "undefined")) {filler("City " + res.MPG.city + "/Hwy " + res.MPG.city, "vehicle_mpg");}} catch (err) {}
         try {filler(res.transmissionType, "vehicle_transmission");} catch (err) {}
         try { if (document.getElementById("vehicle_transmission").value == "UNDEFINED") { document.getElementById("vehicle_transmission").value = "Automatic";} } catch (err) {}
        try {filler(cFL(res.engine.name), "vehicle_engine");} catch (err) {}
          try {if (document.getElementById("vehicle_engine").value == "Engine") {document.getElementById("vehicle_engine").value = "UNDEFINED";} } catch (err) {}
        try {filler(res.categories.vehicleStyle, "vehicle_vehicle_class");} catch (err) {}
         try { if (document.getElementById("vehicle_vehicle_class").value == "N/A") {filler(res.categories.vehicleSize, "vehicle_vehicle_class");} } catch (err) {}

    };
    res.api('/api/vehicle/v2/vins/' + option, options, success, fail);
};
////////////////////EDMUNDS V1 API////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function v1(option, res) {
    var options = {
        "vin": option
    };

    function success(res) {

        var base = res.styleHolder[0];
        var aG = base.attributeGroups;
        var cat = base.categories;

        try{filler(res.styleHolder[0].makeName, "vehicle_make");} catch (err) {}
        try{filler(res.styleHolder[0].modelName, "vehicle_model");} catch (err) {}
        try{filler(res.styleHolder[0].year, "vehicle_year");} catch (err) {}
        try{filler("V" + base.engineCylinder + " " + base.engineSize + "Liter", 'vehicle_engine');} catch (err) {}
        try{filler(cFL(base.engineType), 'vehicle_fuel_type');} catch (err) {}
        try{filler(cFL(aG.DRIVE_TYPE.attributes.DRIVEN_WHEELS.value), 'vehicle_drive_type');} catch (err) {}
        try{filler(cat.PRIMARY_BODY_TYPE, 'vehicle_kind');} catch (err) {}
        try{filler(aG.DOORS.attributes.NUMBER_OF_DOORS.value, 'vehicle_doors');} catch (err) {}
        try{filler(aG.MAIN.attributes.NAME.value, 'vehicle_body_style');} catch (err) {}
        try{filler("HWY " + aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value + "/CITY " + aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value, 'vehicle_mpg');} catch (err) {}
        try{filler("Highway " + aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value, "vehicle_mpg");} catch (err) {}
        try{filler("City " + aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value, "vehicle_mpg"); } catch (err) {}
        try{if ((aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value == "undefined") || (aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value == "undefined")) { filler("UNDEFINED ", "vehicle_mpg");}} catch (err) {}
        try{filler(base.trim.name, 'vehicle_trim');} catch (err) {}
        try{filler(cat.Market, 'vehicle_vehicle_class');} catch (err) {}
        try{filler("Sale", 'vehicle_status');} catch (err) {}
        try{filler(cFL(tLC(base.transmissionType)), 'vehicle_transmission');} catch (err) {}
        title();

    }
    res.api('/v1/api/toolsrepository/vindecoder', options, success, fail);
};
//////////////////////////////////////////////////////////////////////
///////////In the event of an error log to console ///////////////////
function fail(data) {
    console.log(data);
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function VIN_O_Matic(option) {
    var edmunds = new EDMUNDSAPI('8rs3xebeza59dtsv3azp647p');
    v1(option, edmunds);
    v2(option, edmunds);
}
/////////////////////EDMUNDS INIT/////////////////////////////////////
//////////////////////////////////////////////////////////////////////
(function(d, s, id) {
    var js, sdkjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = "../../edmunds.api.sdk.js";
    sdkjs.parentNode.insertBefore(js, sdkjs);
}(document, 'script', 'edmunds-jssdk'));
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
