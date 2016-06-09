
//// the following 3 rows are shared in the js of each page with different parameters
//load the shared menu 
$("#header").load("shared-menu.html");
//load the shared footer
$("#footer").load("shared-footer.html");


//async ajax request
$("document").ready(function(){
    
    //select the right text in the menu
    $('#menu_prodotti').addClass('current');
   
    var parametersMap = getParameters();
    
    var id = parametersMap['id'];
    
    var categoria = parametersMap['categoria'];
    
    console.log(categoria);
    
    if(id === null || id === '' || categoria ===null || categoria === ''){
        console.log("id nulo!");
        return;
    }
    
    
    ajaxGallery(id);
    ajaxDescription(id);
    ajaxSpecificationsList(id);
    ajaxSmartLifeServices(id);
    ajaxAssistanceServices(id);
    
    
});


/*********************************************************************/
/************************   DYNAMIC GO BACK   ************************/
/*********************************************************************/


//set the name and the url of the previous visited page
setDynamicGoBack();
function setDynamicGoBack(){
    var previous_url = document.referrer;
    if (contains(previous_url,"deviceByCategory.html?categoria=smartphone_telefoni") === true){
        $("#VaiALink").html("Vai a <b>Smartphone e Telefoni</b>");
        $("#VaiALink").attr("href", "javascript:history.back()");
    }else if(contains(previous_url,"deviceByCategory.html?categoria=tablet_computer") === true){
        $("#VaiALink").html("Vai a <b>Tablet e Computer</b>");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"deviceByCategory.html?categoria=modem_networking") === true){
        $("#VaiALink").html("Vai a <b>Modem e Networking</b>");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"deviceByCategory.html?categoria=tv_smart_living") === true){
        $("#VaiALink").html("Vai a <b>Tv e Smart Living</b>");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"deviceByCategory.html?categoria=outlet") === true){
        $("#VaiALink").html("Vai a <b>Outlet</b>");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"sls.html") === true){
        $("#VaiALink").html("Vai allo SmartLife precedente");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else if(contains(previous_url,"assistance_services.html") === true){
        $("#VaiALink").html("Vai al servizio di assistenza precedente");
        $("#VaiALink").attr("href","javascript:history.back()");
    }else { //set default link if 
        $("#VaiALink").html("Vai a tutti i servizi");
        $("#VaiALink").attr("href", "prodotti.html"); 
    }
}

//check if str contain sub_str
function contains(str,sub_str){
   return (str.indexOf(sub_str) > -1);
}






/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/


/************************   AJAX GALLERY REQUESTS   **************************/

function ajaxGallery(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'gallery'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            var galleryImages = buildGallery(resultArray[0].alt,
                                             resultArray[0].frontImagePath,
                                             resultArray[0].sideImagePath, 
                                             resultArray[0].backImagePath); 
            
            $("#deviceGallery").append(galleryImages);
            
            //SERVE AD RICARICARE LO SLIDER NEL MOMENTO IN CUI SI RIACCEDE AD UNA PAGINA GIA VISTA!
            SEMICOLON.widget.loadFlexSlider();
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
}



/************************   AJAX DESCRIPTION REQUESTS   **************************/


function ajaxDescription(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'description'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
              
            //Device Name
            document.getElementById("deviceTitle").innerHTML = resultArray[0].nome;
            
            //The little square that says if the device is in promo or new
            var newPromoDiv = buildDivPromoNewTipo(resultArray[0].promo, resultArray[0].nuovo);
            $(".product-image").append(newPromoDiv);
    
            //Price
            var priceIns = buildPrezzo(resultArray[0].prezzo, resultArray[0].promo, resultArray[0].prezzoScontato);
    
    
            //Device Description
            var deviceDesc = buildDescription(resultArray[0].descrizione);
            $("#deviceDescription").append(deviceDesc);
            
            
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}




/*****************   AJAX SPECIFICATIONS LIST REQUESTS   ***********************/

function ajaxSpecificationsList(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'specification'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            for(var i = 0; i < resultArray.length; i++){
                
                
                //Specification list
                var specList = buildSpecList(resultArray[i].titolo, resultArray[i].dettaglio);
                document.getElementById("specificationsList").appendChild(specList);
            }
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
}


function ajaxSmartLifeServices(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'sls'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
           generateLinksForDevices(resultArray, "#device-no-sls", "#slsListDiv", "sls.html?id=");
            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
    
}

function ajaxAssistanceServices(id){
    
    $.ajax({
        method: "GET",
        //dataType: "json", //type of data
        crossDomain: true,
        url: "db/sql_device.php", //Relative or absolute path to file.php file
        data: {id: id, query:'assistance'},
        success: function(response) { 
            
            //parse the json and get an array where the index is the row and the .User is the name of the column
            var resultArray = $.parseJSON(response);
            
            generateLinksForDevices2(resultArray, "#device-no-assistance", "#serviziAssistenzaListDiv", "page.assistance.html?Id=");

            
        },
        error: function(request,error)
        {
            console.log(request+":"+error);
        }
    });
    
    
}


/*********************************************************************/
/**************  HELPER FUNTIONS FOR AJAX REQUESTS   *****************/
/*********************************************************************/



/**************  HELPER FUNTIONS FOR GALLERY   *****************/

function buildGallery(alt, frontImagePath, sideImagePath, backImagePath){
    
    var divElement = document.createElement("DIV");
                                                    
    divElement.setAttribute("class", "slider-wrap");
    divElement.setAttribute("data-lightbox", "gallery");
    
    console.log(frontImagePath);
    console.log(sideImagePath);
    console.log(backImagePath);
    
    var Slider1 = buildSlide(alt, frontImagePath);
    divElement.appendChild(Slider1);
    
    if (sideImagePath !== null){
        var Slider2 = buildSlide(alt, sideImagePath);
        divElement.appendChild(Slider2);
    }
    
    if (backImagePath !== null){
        var Slider3 = buildSlide(alt, backImagePath);
        divElement.appendChild(Slider3);           
    }
    
    
    
    return divElement;
    
}                                               

function buildSlide(nome, imagePath) {
    var divElement = document.createElement("DIV");
    
    divElement.setAttribute("class", "slide");
    divElement.setAttribute("data-thumb", imagePath);
    
    var aElement = document.createElement("A");
    
    aElement.setAttribute("href", imagePath);
    aElement.setAttribute("data-lightbox", "gallery-item");
    aElement.setAttribute("title", nome);
    
    var imgElement = document.createElement("IMG");
    
    imgElement.setAttribute("src", imagePath);
    imgElement.setAttribute("alt", nome);
    
    aElement.appendChild(imgElement);
    
    divElement.appendChild(aElement);
    
    return divElement;
}








/**************  HELPER FUNTIONS FOR DESCRIPTION   *****************/


function buildDivPromoNewTipo(promo,nuovo) {
    
    if(promo === '1'){
        var divElement = document.createElement("DIV");
        
        divElement.setAttribute("class","sale-flash");
        divElement.innerHTML = "Promo";

        return divElement;
        
    }else if(nuovo === '1'){
        var divElement = document.createElement("DIV");
        
        divElement.setAttribute("class","sale-flash");
        divElement.innerHTML = "Nuovo";
        
        return divElement;
    }
}


function buildPrezzo(prezzo, promo, prezzoScontato) {
    
    var divElement = document.getElementById("divPrezzo");
    
    if ( promo === '1'){
        var delElement = document.createElement("DEL");
        delElement.innerHTML = prezzo + "&euro;" + "&nbsp; " + "&nbsp;";
        divElement.appendChild(delElement);
        
        var prezzoIns = document.createElement("INS");
        prezzoIns.innerHTML = prezzoScontato + "&euro;";
    
        divElement.appendChild(prezzoIns);
    }else{
        var prezzoIns = document.createElement("INS");
        prezzoIns.innerHTML = prezzo + "&euro;";
    
        divElement.appendChild(prezzoIns);  
    }    
    
}


function buildDescription(descrizione){
    var descrizioneP = document.createElement("P");
    descrizioneP.innerHTML = descrizione;
    
    return descrizioneP;
}



//for each device correlated to this service generate a link in the activation section
function generateLinksForDevices(arrayRes, idNoService, idDiv, page){
    if ( arrayRes.length > 0){
        //hide the default message
        $(idNoService).hide();
    }
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        $(idDiv).append(document.createElement("BR"));
        $(idDiv).append(buildLinkDevice(arrayRes[i].titolo,arrayRes[i].id, page));
    }
}

//for each device correlated to this service generate a link in the activation section MATTEO DB NAME TITLE
function generateLinksForDevices2(arrayRes, idNoService, idDiv, page){
    if ( arrayRes.length > 0){
        //hide the default message
        $(idNoService).hide();
    }
    
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        $(idDiv).append(document.createElement("BR"));
        $(idDiv).append(buildLinkDevice(arrayRes[i].Title,arrayRes[i].Id, page));
    }
}


//build the link obj of the single device for this smart life service
function buildLinkDevice(nome, id, page){
    var linkSingleDevice = document.createElement("A");
    linkSingleDevice.setAttribute("href", page + id);
    linkSingleDevice.innerHTML =  "&#10095; " + nome;
    return linkSingleDevice; 
}





/**************  HELPER FUNTIONS FOR SPECIFICATION LIST   *****************/

function buildSpecList(titolo, dettaglio){
        
    var liElement = document.createElement("LI");
    
    liElement.innerHTML = '<i class="icon-caret-right"></i>' + titolo + " " + dettaglio;
    
    return liElement;
}


/*********************************************************************/
/**************  PARAMETERS PARSER HELPER FUNCTION   *****************/
/*********************************************************************/

//In our website the parameters must be separed by & example id=1&name=Iphone
function getParameters(){
    
    var parametersMap = {};
    
    var query = window.location.search.substring(1);
    
    var parameterList = query.split("&");
    
    for(var i = 0; i < parameterList.length; i++) {
        var pair = parameterList[i].split("=");
        
        parametersMap[pair[0]] = pair[1];
    }
    
    console.log(parametersMap);
    
    return parametersMap;
}