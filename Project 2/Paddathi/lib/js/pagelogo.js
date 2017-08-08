$(document).ready(function(){
    //Hides the minus button from the bottom navigation on page load
    $("#minus").hide();
    //Hide all the description divs on page load.
    for (i = 11; i <=16 ; i++) {    
    $("#"+i).hide();
    }
    $(".nav_men").click(function(){
            var x = $(this).attr('id');
            for (i = 1; i <=6 ; i++) { 
             if(x==i){
                 var y=1+x;
                 $('#'+y).show();
                 for(j=1;j<=6;j++){
                     if(j!=x){
                         var k=10+j;
                         $('#'+k).hide();
                     }
                 }
             }
            }    
    });
});    