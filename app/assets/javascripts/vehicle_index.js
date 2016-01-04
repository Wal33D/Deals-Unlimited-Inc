
///////////////Index  pill button active tabs/////////////////////////
//////////////////////////////////////////////////////////////////////
jQuery(document).ready(function($) {

    var url = window.location.href; 

    var carUrl = /=ar&/;
    var truckUrl = /=ruck&/;
    var suvUrl = /=uv&/;
    var vanUrl = /=an&/;
    var priceUrl = /price/;
    var newUrl = /class=blue-btn&q%5Bs%5D=created_at/;
    var mileageUrl = /mileage/;
    var yearUrl = /year/;
    var car_kindUrl = /5D=Car/;
    var truck_kindUrl = /5D=Truck/;
    var suv_kindUrl = /5D=SUV/;
    var van_kindUrl = /5D=Van/;

    if(carUrl.test(url) || car_kindUrl.test(url)){ $( "#car-btn" ).css('background-color', '#bbbfc4');}
        if(truckUrl.test(url) || truck_kindUrl.test(url)){ $( "#truck-btn" ).css('background-color', '#bbbfc4');}
        if(suvUrl.test(url) || suv_kindUrl.test(url)){ $( "#suv-btn" ).css('background-color', '#bbbfc4');}
        if(vanUrl.test(url) || van_kindUrl.test(url)){ $( "#van-btn" ).css('background-color', '#bbbfc4');}
        if(priceUrl.test(url)){ $( "#price-btn a.sort_link.asc, #price-btn a.sort_link.desc " ).css('background-color', '#bbbfc4');}
        if(newUrl.test(url)){ $( "#new-btn" ).css('background-color', '#bbbfc4');}
        if(mileageUrl.test(url)){ $("#mileage-btn a.sort_link.asc, #mileage-btn a.sort_link.desc "  ).css('background-color', '#bbbfc4');}
        if(yearUrl.test(url)){ $( "#year-btn a.sort_link.asc, #year-btn a.sort_link.desc " ).css('background-color', '#bbbfc4');
    }

 
});