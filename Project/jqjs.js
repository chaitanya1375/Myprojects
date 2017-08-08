$(document).ready(function(){
    $(".btnh").click(function(){
        var innhval= $(".innh").val();
        if(innhval=='0'){
       $(".innerdiv").animate({left: '800px'});
            $(".innh").val("1");
        }
        var innhval1= $(".innh").val();
       if(innhval1=='1'){
           $(".innerdiv").animate({left: '800px'});   
           $(".innh").val("0");
       } 
    });
    $(".btnv").click(function(){
        var innvval= $(".innv").val();
        if(innvval=='0'){
       $(".innerdiv").animate({top: '370px'});
            $(".innv").val("1");
        }
        var innvval1= $(".innv").val();
       if(innvval1=='1'){
           $(".innerdiv").animate({top: '370px'});   
           $(".innv").val("0");
       }
    });   
});
