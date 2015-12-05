//= require jquery
//= require jquery_ujs
//= require_tree .

$(".loading-screen").fadeOut(750);
setTimeout(function() {
    $(".body").animate({
        opacity: "1"
    }, 350);
}, 200);
jQuery(document).ready(function($) {

    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});

jQuery(document).ready(function($) {
    var $window = $('#window');
    var $textarea = $('#contact_message');
    $textarea.height($(window).height() * 0.2);
});
function tLC(string){
	if(string){
  	  return string.toLowerCase();
	}
	else return " ";
};
function cFL(string) {
	if(string){
  	  return string.charAt(0).toUpperCase() + string.slice(1);
	}
	else return " ";
};
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


    setTimeout(function(){ $("div.review-box").hide(); }, 3000);


