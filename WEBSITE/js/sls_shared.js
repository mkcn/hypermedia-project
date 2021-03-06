/**
*  Shared function for all the page of smart life services  (sls_list.html and promozione_sls.html)
*/

//debug var to test with local or remote php call 
var DEBUG = false;

//path for phonegap that needs the real path and not the relative
var basePath;

if(DEBUG){
    basePath = '';
}else{
    basePath = 'http://timhypermedia.altervista.org/'
}


//get the title of the page base on the category 
//long : if true add "Smart Life" at start of the string
function getTitlePageFromCategory(categ,long){
    var tit = "";
    if(long){
     tit = "Smart Life - ";
    }
    if(categ === "tv_entertainment"){
        tit += "Tv & Entertainment";    //TODO check if don't need special char
    }else if(categ === "salute_benessere"){
        tit += "Salute & Benessere";
    }else if(categ === "casa_famiglia"){
        tit += "Casa e Famiglia";
    }else if(categ === "servizi_persona"){
        tit += "Servizi alla persona";
    }else
        tit += "Categoria non esistente."
    return tit;
}

/*********************************************************************/
/************************   AJAX REQUESTS   **************************/
/*********************************************************************/



//receive the parameter from the caller and do an asyn ajax get request with par type
function asyncAjaxRequestSls(categ){
    //async ajax request
    $("document").ready(function(){
        $.ajax({
            method: "GET",
            //dataType: "json", //type of data
            crossDomain: true,
            url: basePath + "db/sql_sls.php", //Relative or absolute path to file.php file
            data: {categoria:categ},
            success: function(response) {
                //parse the json and get an array
                var arrayRes = $.parseJSON(response);
                handleResult(arrayRes);
                //after the page is filled call the function to set the position of the footer              
                placeFooter();
            },
            error: function(request,error)
            {
                console.log(request+":"+error);
            }
        });
    });
}

//promotion request
function asyncAjaxRequestSlsPromotion(){
    //async ajax request
    $("document").ready(function(){
        $.ajax({
            method: "GET",
            //dataType: "json", //type of data
            crossDomain: true,
            url: basePath + "db/sql_sls.php", //Relative or absolute path to file.php file
            data: {prom:true},
            success: function(response) {
                //parse the json and get an array
                var arrayRes = $.parseJSON(response);
                handleResult(arrayRes);
                
                //after the page is filled call the function to set the position of the footer   
                placeFooter();
            },
            error: function(request,error)
            {
                console.log(request+":"+error);
            }
        });
    });
}


//for each row generate an obj and add it to the main list
function handleResult(arrayRes){
    //for each item add to the container
    for (i = 0; i < arrayRes.length; i++) {
        console.log(arrayRes[i].promozione);
        //TODO if not all service is define check here and set button "disabled" 
        var newItem = createItem(arrayRes[i].id,arrayRes[i].titolo,arrayRes[i].promozione,arrayRes[i].attivabile, arrayRes[i].des_offerta,arrayRes[i].img_pres);
        $("#sls_list").append(newItem);
    }
}


//create the main div
function createItem(id,title,promozione,attivabile,desciption,img){
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product clearfix");
    divElement.appendChild(addDivImg(id,title,img,promozione));
    divElement.appendChild(addDivProduct(id,title,attivabile,desciption));
    
    return divElement;
}


//create the div with the img
function addDivImg(id,title,img,promozione){
        
    var imgElement = document.createElement("IMG"); 
    imgElement.setAttribute("src",img);
    imgElement.setAttribute("class","img-rounded");
    imgElement.setAttribute("alt",title);
    
    /* remove comment if you want the link on the image
    var aElement = document.createElement("A");
    aElement.setAttribute("href","sls.html?id=" + id );
    aElement.appendChild(imgElement);
    */
    
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product-image");
    divElement.appendChild(imgElement);
    
    //if the element if in promotion
    if(promozione === "1"){
        var divPromoElement = document.createElement("DIV");
        divPromoElement.setAttribute("class","sale-flash");
        divPromoElement.innerHTML = "Promo";
        
        divElement.appendChild(divPromoElement);
    }
    return divElement;
}

//create the div with the info of the product
function addDivProduct(id,title,attivabile,desciption){
    
    var h3Element = document.createElement("H3"); 
    h3Element.setAttribute("class","product-title" );
    h3Element.innerHTML = title;
    
    var pElement = document.createElement("P");
    pElement.innerHTML = desciption;
    
    var buttonElement = document.createElement("BUTTON");
    buttonElement.setAttribute("class","btn btn-primary btn-lg" );
    buttonElement.innerHTML = "Scopri";
    if( attivabile === "0"){
        buttonElement.setAttribute("disabled","");
    }
    
    var aElement = document.createElement("A");
    aElement.setAttribute("href","sls.html?id=" + id  );
    aElement.appendChild(buttonElement);
                    
    var divElement = document.createElement("DIV"); 
    divElement.setAttribute("class","product-desc text-center");
    divElement.appendChild(h3Element);
    divElement.appendChild(pElement);
    divElement.appendChild(aElement);
    
    return divElement;
}

/*
EXAMPLE of the built item

<div class="product clearfix">
    <div class="product-image">
        <div class ="sale-flash">Promo</div>
        <a href="sls.html"><img src="images/smartLifeServices/salute_benessere.jpg" alt="TIM Vision">
        </a>
    </div>
    <div class="product-desc text-center">
        <h3 class="product-title">Sony Smartband FE (STATIC)</h3>
        <p>Un innovativo braccialetto da polso in grado di registrare automaticamente le tue attività fisiche, sociali e di intrattenimento 
        </p>
        <a href="sls.html?id=0"><button type="button" class="btn btn-primary btn-lg">Scopri id=0</button></a>
    </div>
</div>

*/




//when the window change the event is called and the footer is re-placed
jQuery(window).resize(function () {
    if( 
        (Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) < epsilon &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) < epsilon ) && 
        Math.abs( (windowHeight - $(window).height()) / (windowHeight + $(window).height())) !== 0 &&
        Math.abs( (windowWidth - $(window).width()) / (windowWidth + $(window).width())) !== 0 
        ){
        return;
    }

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) 
       && windowWidth === $(window).width()){
        return;
    }else{
        windowWidth = $(window).width();
    }
    placeFooter();
});


// calculate and set the position of the footer
function placeFooter() {
    $('#footer').css({ 'margin-top': 0 });
    windowHeight = $(window).height();
    windowWidth = $(window).width();
    var windowH = $(window).height();
    var wrapperH = $('#header').height() + $('#page_title').height() + $('#content').height();
    if( windowH > wrapperH ) {
        $('#footer').css({ 'margin-top': ( windowH - wrapperH ) });        
    }
}