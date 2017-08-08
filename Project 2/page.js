$(document).ready(function(){
    //Hide all the description divs on page load.
    for (i = 11; i <=16 ; i++) {    
    $("#"+i).hide();
    }
    //hide the minus option on the footer on page load.
    $(".minus").hide();
    $(".empty_1").hide();
    $(".botm_cnsl").hide();
    
    //Function to display the entered text.
    $(".btn").click(function(){
        var x = $(".inp").val();
        $(".display").append(x);
    });
    
    $(".plus").click(function(){
        $(".botm_menu").css("margin-top", "20%");
        $(".minus").show();
        $(".plus").hide();
        $(".empty_1").show();
    $(".botm_cnsl").show();
    });
    
    $(".minus").click(function(){
        $(".botm_menu").css("margin-top", "33%");
        $(".plus").show();
        $(".minus").hide();
        $(".empty_1").hide();
    $(".botm_cnsl").hide();
    });
    
    //Function to show the description
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