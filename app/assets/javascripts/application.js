//= require jquery
//= require jquery_ujs
//= require_tree .
//////////////////Fundamental Code////////////////////////////////////
//////////////////////////////////////////////////////////////////////
jQuery(document).ready(function($) {

    try {
        $(".button-collapse").sideNav();
    } catch (err) {}
    try {
        $(".dropdown-button").dropdown();
    } catch (err) {}
    try {
        $('#mobile-demo').fadeIn();
    } catch (err) {}
    try {
        $('#fadeInFast').fadeIn(100);
    } catch (err) {}
 
        try {
            $('#vehicle_col').fadeIn(200);
    } catch (err) {}

    //try{setTimeout("$('#contact-tab').fadeIn(500);", 1)}catch(err){}
   // (function titleScroller(text) {
   //     document.title = text;
   //     setTimeout(function() {
   //         titleScroller(text.substr(1) + text.substr(0, 1));
   //     }, 500);
   // }("Deals Unlimited, Inc. Fine Used Vehicles - 269-324-4285 -  Come See Us Today! - "));

    var $window = $('#window');
    var $textarea = $('#contact_message');

    $textarea.height($(window).height() * 0.2);
    resizeVehiclePane();
    try {
        setTimeout("$('#reselect').fadeOut('slow')", 4000);
    } catch (err) {}
    try {
        setTimeout("$('.alert').fadeOut('slow')", 4000);
    } catch (err) {}

});

///////////////////Resize Vehicle Panel///////////////////////////////
//////////////////////////////////////////////////////////////////////
function resizeVehiclePane(){
    var internalSize = ($('body').height() - $('.nav-wrapper').height() - $('.footer-vehicles').height());

    if( ( $('body').width() ) >= 700 )
        { $('.vehicle_panel').height(internalSize - 30); }
    else{
     $('.vehicle_panel').height(internalSize + 8);
        }

}

    function PU(object){
        document.getElementById('submit_status_' + object.id.replace("up","")).click();
    }
    function VSU(object){
        document.getElementById('status_form_'+ object.id).value=object.innerHTML;
        document.getElementById('submit_status_' + object.id).click();
        $('#tr_' + object.id).fadeOut();
    }
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function setstatus(status){
    if(status=="For Sale"){ document.getElementById('vehicle_status').value="Sale";
    }else{ document.getElementById('vehicle_status').value=status;}
    document.getElementById('update').click();
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function tradeIn_yes(val) {
    if (val == 0) {
        $(".tradein").slideDown(1000);
        $("#credit_tradein").val("Yes, I have a trade in.");
        document.getElementById('tradein-div').innerHTML = "<button class ='btn btn-default red' type='button' id='credit-false' style='width:100%!important;' onclick='tradeIn_yes(1);'>No</button>";
        try {
            document.getElementById('tradein-div-2').innerHTML = "<button class ='btn btn-default red' type='button' id='credit-false' style='width:100%!important;' onclick='tradeIn_yes(1);'>No</button>";
        } catch (err) {}

    } else {
        $(".tradein").slideUp(1000);
        $("#credit_tradein").val("No, I do not have a trade in.");
        document.getElementById('tradein-div').innerHTML = "<button class='btn btn-default blue' type='button' id='credit-true' style='width:100%!important; 'onclick='tradeIn_yes(0);'>Yes</button>";
        try {
            document.getElementById('tradein-div-2').innerHTML = "<button class='btn btn-default blue' type='button' id='credit-true' style='width:100%!important;' onclick='tradeIn_yes(0);'>Yes</button>";
        } catch (err) {}
    }
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function coap(val) {
    if (val === 0) {
        $("#single-applicant").fadeOut(200);
        $("#double-applicant").fadeIn(200);
    }
    if (val === 1) {
        $("#double-applicant").fadeOut(200);
        $("#single-applicant").fadeIn(200);
    }
}
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

function highlight(timeout) {


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

    }, timeout);
};
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
        try {
            filler(res.make.name, "vehicle_make");
        } catch (err) {}
        try {
            filler(res.model.name, "vehicle_model");
        } catch (err) {}
        try {
            filler(res.years[0].year, "vehicle_year");
        } catch (err) {}
        try {
            filler(cFL(res.engine.type), "vehicle_fuel_type");
        } catch (err) {}
        try {
            filler(res.categories.vehicleStyle, "vehicle_body_style");
        } catch (err) {}
        try {
            filler(cFL(res.drivenWheels), "vehicle_drive_type");
        } catch (err) {}
        try {
            filler(res.numOfDoors, "vehicle_doors");
        } catch (err) {}

        try {
            if ((res.MPG.city !== "undefined") && (res.MPG.highway !== "undefined")) {
                filler("City " + res.MPG.city + "/Hwy " + res.MPG.city, "vehicle_mpg");
            }
        } catch (err) {        try {
            filler("Highway " + res.MPG.highway, "vehicle_mpg");
        } catch (err) {}
        try {
            filler("City " + res.MPG.city, "vehicle_mpg");
        } catch (err) {}}
        try {
            filler(res.transmissionType, "vehicle_transmission");
        } catch (err) {}
        try {
            if (document.getElementById("vehicle_transmission").value == "UNDEFINED") {
                document.getElementById("vehicle_transmission").value = "Automatic";
            }
        } catch (err) {}
        try {
            filler(cFL(res.engine.name), "vehicle_engine");
        } catch (err) {}
        try {
            if (document.getElementById("vehicle_engine").value == "Engine") {
                document.getElementById("vehicle_engine").value = "UNDEFINED";
            }
        } catch (err) {}
        try {
            filler(res.categories.vehicleStyle, "vehicle_vehicle_class");
        } catch (err) {}
        try {
            if (document.getElementById("vehicle_vehicle_class").value == "N/A") {
                filler(res.categories.vehicleSize, "vehicle_vehicle_class");
            }
        } catch (err) {}

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
        
        var minivan = /Pass/;
        var base = res.styleHolder[0];
        var aG = base.attributeGroups;
        var cat = base.categories;

        try {
            filler(res.styleHolder[0].makeName, "vehicle_make");
        } catch (err) {}
        try {
            filler(res.styleHolder[0].modelName, "vehicle_model");
        } catch (err) {}
        try {
            filler(res.styleHolder[0].year, "vehicle_year");
        } catch (err) {}
        try {
            filler("V" + base.engineCylinder + " " + base.engineSize + "Liter", 'vehicle_engine');
        } catch (err) {}
        try {
            filler(cFL(base.engineType), 'vehicle_fuel_type');
        } catch (err) {}
        try {
            filler(cFL(aG.DRIVE_TYPE.attributes.DRIVEN_WHEELS.value), 'vehicle_drive_type');
        } catch (err) {}
        try {
        if(cat.PRIMARY_BODY_TYPE =="Minivan"){
            filler("Van", 'vehicle_kind');
        }else if(cat.market=="Minivan"){
            filler("Van", 'vehicle_kind');
        }else{
            filler(cat.PRIMARY_BODY_TYPE, 'vehicle_kind');
        }
        } catch (err) {}
        try {
            filler(aG.DOORS.attributes.NUMBER_OF_DOORS.value, 'vehicle_doors');
        } catch (err) {}
        try {
            filler(aG.MAIN.attributes.NAME.value, 'vehicle_body_style');
        } catch (err) {}
    
        try {
            filler("Highway " + aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value, "vehicle_mpg");
        } catch (err) {}
        try {
            filler("City " + aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value, "vehicle_mpg");
        } catch (err) {}
        try {
            if ((aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value == "undefined") || (aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value == "undefined")) {
                filler("UNDEFINED ", "vehicle_mpg");
            }
        } catch (err) {}
            try {
            filler("HWY " + aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value + "/CITY " + aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value, 'vehicle_mpg');
        } catch (err) {}
        try {
            filler(base.trim.name, 'vehicle_trim');
        } catch (err) {}
        try {
            filler(cat.Market, 'vehicle_vehicle_class');
        } catch (err) {}
        
        try {
            filler(cFL(tLC(base.transmissionType)), 'vehicle_transmission');
        } catch (err) {}
        title();

        filler("Sale", 'vehicle_status');

        $('#vehicle_status').css('background-color', "rgb(76, 175, 80)");
      

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
    if (option === "") {
        alert("VIN is empty, Please insert a VIN number")
    } else {
        var edmunds = new EDMUNDSAPI('8rs3xebeza59dtsv3azp647p');
        v1(option, edmunds);
        v2(option, edmunds);
        highlight(2500)
    }
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
function acceptFeatures() {

    var selected = document.getElementById('selected-list').innerHTML;

    for (i = 0; i < 42; i++) {
        selected = selected.replace('onclick="remove(this)"', '');
    };
    document.getElementById('selected-list').innerHTML = selected;
    document.getElementById('vehicle_other_options').value = selected;

    $("#available-list").fadeOut();
    //$( "#accept" ).prop( "disabled", true );
    document.getElementById('accept-div').innerHTML = '<button onclick="editFeatures();" class=" btn waves-effect waves-white" id="edit" style="font-weight:bold; width:100%!important; background-color:#ffab40!important;" type="button">Edit Selections</button>';
    $("#feature-panel").slideUp(1000);
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function editFeatures() {
    var selected = document.getElementById('selected-list').innerHTML;
    for (i = 0; i < 42; i++) {
        selected = selected.replace('<li class="list-group-item">', '<li class="list-group-item" onclick="remove(this)">');
    };
    document.getElementById('selected-list').innerHTML = selected;
    $("#available-list").fadeIn();
    $("#selected-list").fadeIn();
    $("#accept").prop("disabled", false);
    $("#edit").prop("disabled", true);
    document.getElementById('accept-div').innerHTML = '<button onclick="acceptFeatures();" class="btn green btn waves-effect waves-teal" id="accept" type="button" style="width:100%!important; font-weight:bold;">Accept Options</button>';
    $("#feature-panel").slideDown(1000);

}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function getPaging(str) {
    document.getElementById('selected-list').innerHTML = document.getElementById('selected-list').innerHTML + '<li class="list-group-item" onclick="remove(this)">' + str + '</li>';
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function remove(link) {
    link.parentNode.parentNode.removeChild(link.parentNode);
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function toggleRemovable(state) {
    var text = document.getElementById('selected-list').innerHTML;
    selected = selected.replace('onclick="remove(this)"', '');
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function sortUnorderedList(ul, sortDescending) {
    if (typeof ul == "string")
        ul = document.getElementById(ul);
    // Idiot-proof, remove if you want
    if (!ul) {
        alert("The UL object is null!");
        return;
    }
    // Get the list items and setup an array for sorting
    var lis = ul.getElementsByTagName("LI");
    var vals = [];
    // Populate the array
    for (var i = 0, l = lis.length; i < l; i++)
        vals.push(lis[i].innerHTML);
    // Sort it
    vals.sort();
    // Sometimes you gotta DESC
    if (sortDescending)
        vals.reverse();
    // Change the list on the page
    for (var i = 0, l = lis.length; i < l; i++)
        lis[i].innerHTML = vals[i];
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
