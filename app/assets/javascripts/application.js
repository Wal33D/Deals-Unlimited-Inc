//= require jquery
//= require jquery_ujs
//= require_tree .

//////////////////Fundamental Code////////////////////////////////////
//////////////////////////////////////////////////////////////////////
$(".loading-screen").fadeOut(500);
setTimeout(function() {
    $(".body").animate({
        opacity: "1"
    }, 250);
}, 100);
/////////////Makes Contact Form the Proper Size///////////////////////
//////////////////////////////////////////////////////////////////////
jQuery(document).ready(function($) {
    var $window = $('#window');
    var $textarea = $('#contact_message');
    $textarea.height($(window).height() * 0.2);
});
//////////////////////////////////////////////////////////////////////
//////////////////END/// Fundamental Code ///END//////////////////////

/////////////////////////To Lower Case////////////////////////////////
//////////////////////////////////////////////////////////////////////
function tLC(string){
    if(string){return string.toLowerCase();}
    else return " ";
};
/////////////Makes the First letter of a string into a Captial////////
//////////////////////////////////////////////////////////////////////
function cFL(string) {
    if(string){return string.charAt(0).toUpperCase() + string.slice(1);}
    else return " ";
};
//////////////////////////////////////////////////////////////////////


  
  $('#button').click(function() {
setTimeout(function() {

    var emptyTextBoxes = $('input:empty').filter(function() { return this.value == ""; });
    var string = "The blank textbox ids are - \n";

    emptyTextBoxes.each(function() {

      string += "\n" + this.id;
    });
    var emptyTextBoxes = $('input:empty').filter(function() { return this.value == ""; });
    emptyTextBoxes.css( "border", "1px double red");
        emptyTextBoxes.css( "background-color", "#eee");
   var emptyTextBoxes = $('textarea:empty').filter(function() { return this.value == ""; });
    emptyTextBoxes.css( "border", "1px double red");
        emptyTextBoxes.css( "background-color", "#eee");

      emptyTextBoxes = $('input:empty').filter(function() { return this.value == " "; });
    emptyTextBoxes.css( "border", "1px double red");
            emptyTextBoxes.css( "background-color", "#eee");
             emptyTextBoxes = $('input:empty').filter(function() { return this.value == "UNDEFINED"; });
    emptyTextBoxes.css( "border", "1px double orange");
        emptyTextBoxes.val("");

            emptyTextBoxes.css( "background-color", "#ddd");

    }, 2000);

  });
    
//////////////////////////////////////////////////////////////////////
function title(){
   var veh_title = document.getElementById('vehicle_title');
       veh_title.value = document.getElementById('vehicle_year').value +" "+ document.getElementById('vehicle_make').value +" "+  document.getElementById('vehicle_model').value;
};
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function filler(res, title){
    if((document.getElementById(title).value == "")||(document.getElementById(title).value == "null")||(document.getElementById(title).value == "UNDEFINED")||(document.getElementById(title).value == "N/A")){
        var value = document.getElementById(title).value.trim();
        if(res){document.getElementById(title).value = res;}
        else{document.getElementById(title).value="UNDEFINED"}
    }else{ return;};
};
/////////////////////EDMUNDS V2 API///////////////////////////////////
//////////////////////////////////////////////////////////////////////
function v2(option, res) {
    var options = {};
    function success(res) {
        filler(res.make.name,"vehicle_make");
        filler(res.model.name,"vehicle_model");
        filler(res.years[0].year,"vehicle_year");
      try{filler(cFL(res.engine.type), "vehicle_fuel_type");}catch(err){}
     
       try{ filler(res.categories.vehicleStyle,"vehicle_body_style");}catch(err){}
        filler(cFL(res.drivenWheels), "vehicle_drive_type");
        filler(res.numOfDoors, "vehicle_doors");
        try {filler("Highway "+res.MPG.highway, "vehicle_mpg");}catch(err){}
        try {filler("City "+res.MPG.city, "vehicle_mpg");}catch(err) {}
        try {if((res.MPG.city !== "undefined") && (res.MPG.highway !=="undefined")){
        filler("City "+res.MPG.city+"/Hwy "+res.MPG.city, "vehicle_mpg");
        }}catch(err) {}

        filler(res.transmissionType, "vehicle_transmission");
        if(document.getElementById("vehicle_transmission").value  == "UNDEFINED"){
            document.getElementById("vehicle_transmission").value = "Automatic";
        }        
          

          try{  filler(cFL(res.engine.name), "vehicle_engine");}catch(err){}

        if(document.getElementById("vehicle_engine").value  == "Engine"){
            document.getElementById("vehicle_engine").value = "UNDEFINED";
        }        

        try{filler(res.categories.vehicleStyle, "vehicle_vehicle_class");}catch(err){}
        
        if(document.getElementById("vehicle_vehicle_class").value  == "N/A"){
            filler(res.categories.vehicleSize,"vehicle_vehicle_class");
        }        


        //adder("Interior Features", res.options[1].options[0].name); 
        //adder("Interior Features", res.options[1].options[1].name);
        //adder("Interior Features", res.options[1].options[2].name);
        //adder("Interior Features", res.options[1].options[3].name);
        //adder("Interior Features", res.options[1].options[4].name);
        //adder("Exterior Features", res.options[3].options[0].name);
        //adder("Exterior Features", res.options[3].options[1].name);
    };
    res.api('/api/vehicle/v2/vins/'+option, options, success, fail);
};
////////////////////EDMUNDS V1 API////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function v1(option, res) {
    var options = {"vin": option };
    function success(res) {

        var base = res.styleHolder[0];
        var aG = base.attributeGroups;
        var cat = base.categories;

        filler(res.styleHolder[0].makeName,"vehicle_make");
        filler(res.styleHolder[0].modelName,"vehicle_model");
        filler(res.styleHolder[0].year,"vehicle_year");
        filler("V" + base.engineCylinder + " " + base.engineSize + "Liter",'vehicle_engine');
        filler(cFL(base.engineType),'vehicle_fuel_type');
        filler(cFL(aG.DRIVE_TYPE.attributes.DRIVEN_WHEELS.value),'vehicle_drive_type');
        filler(cat.PRIMARY_BODY_TYPE,'vehicle_kind');
        filler(aG.DOORS.attributes.NUMBER_OF_DOORS.value,'vehicle_doors');
        filler(aG.MAIN.attributes.NAME.value,'vehicle_body_style');
       try{filler("HWY "+aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value +"/CITY "+aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value,'vehicle_mpg');}catch(err){}
        try{filler("Highway "+ aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value, "vehicle_mpg");}catch(err){}
        try{filler("City "+ aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value, "vehicle_mpg");}catch(err){}
        try{if((aG.SPECIFICATIONS.attributes.EPA_HIGHWAY_MPG.value == "undefined") || (aG.SPECIFICATIONS.attributes.EPA_CITY_MPG.value =="undefined")){
        filler("UNDEFINED ", "vehicle_mpg");
        }}catch(err){}

        filler(base.trim.name,'vehicle_trim');
        filler(cat.Market,'vehicle_vehicle_class');
        filler("Sale",'vehicle_status');
        filler(cFL(tLC(base.transmissionType)),'vehicle_transmission');
          title();

    }
    res.api('/v1/api/toolsrepository/vindecoder', options, success, fail);
};
//////////////////////////////////////////////////////////////////////
///////////In the event of an error log to console ///////////////////
function fail(data) {console.log(data);}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
function VIN_O_Matic(option) {
    var edmunds =  new EDMUNDSAPI('8rs3xebeza59dtsv3azp647p');

        v1(option, edmunds);
        v2(option, edmunds);

   
}
/////////////////////EDMUNDS INIT/////////////////////////////////////
//////////////////////////////////////////////////////////////////////
(function(d, s, id) {
    var js, sdkjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s);
    js.id = id;
    js.src = "../../edmunds.api.sdk.js";
    sdkjs.parentNode.insertBefore(js, sdkjs);
}(document, 'script', 'edmunds-jssdk'));
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////
//////////OLD WORKING FORM FILLER CODE ///////////////////////////////
//////////////////////////////////////////////////////////////////////
/*
function title(){
   var veh_title = document.getElementById('vehicle_title');
       veh_title.value = document.getElementById('vehicle_year').value +" "+ document.getElementById('vehicle_make').value +" "+  document.getElementById('vehicle_model').value;
};
function filler(valueHolder, id){
  var vehicle_var = document.getElementById(id).value = valueHolder;
};
function fillFields(res){

    var base = res.styleHolder[0];
    var aG = base.attributeGroups;
    var cat = base.categories;

    filler(base.makeName,'vehicle_make');
    filler(base.modelName,'vehicle_model');
    filler(base.year,'vehicle_year');
         title();

    filler("V" + base.engineCylinder + " " + base.engineSize + "Liter",'vehicle_engine');
    filler(cFL(base.engineType),'vehicle_fuel_type');
    filler(cFL(aG.DRIVE_TYPE.attributes.DRIVEN_WHEELS.value),'vehicle_drive_type');
    filler(cat.PRIMARY_BODY_TYPE,'vehicle_kind');
    filler(aG.DOORS.attributes.NUMBER_OF_DOORS.value,'vehicle_doors');
    filler(aG.MAIN.attributes.NAME.value,'vehicle_body_style');
    filler(aG.SPECIFICATIONS.attributes.EPA_COMBINED_MPG.value,'vehicle_mpg');
    filler(base.trim.name,'vehicle_trim');
    filler(cat.Market,'vehicle_vehicle_class');
    filler("Sale",'vehicle_status');
    filler(cFL(tLC(base.transmissionType)),'vehicle_transmission');

};
function myFunction(option) {

    // Instantiate the SDK
    var res = new EDMUNDSAPI('8rs3xebeza59dtsv3azp647p');
    // Optional parameters
    var options = {
        "vin": option
    };
    // Callback function to be called when the API response is returned
    function success(res) {
        
        fillFields(res);

        }
        // Oops, Houston we have a problem!
    function fail(data) {
            console.log(data);
        }
        // Fire the API call
    res.api('/v1/api/toolsrepository/vindecoder', options, success, fail);
    // Additional initialization code such as adding Event Listeners goes here
};
// Load the SDK asynchronously
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
*/
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
