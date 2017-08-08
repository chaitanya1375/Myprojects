$(document).ready(function(){
    $(".btnh").click(function(){
        var x = $(".innerdiv").position();
        //alert("Top position: " + x.top + " Left position: " + x.left);
        if(x.left===433){
        $(".innerdiv").animate({left: '800px'});  
        }
        var y = $(".innerdiv").position();
        //alert("Top position: " + y.top + " Left position: " + y.left);
        if(y.left===800){
        $(".innerdiv").animate({left: '433px'});    
        }
    });
    
    $(".btnv").click(function(){
        var a = $(".innerdiv").position();
        //alert("Top position: " + a.top + " Left position: " + a.left);
        if(a.top===9){
        $(".innerdiv").animate({top: '370px'});   
        }
        var b =$(".innerdiv").position();
        //alert("Top position: " + b.top + " Left position: " + b.left);
        if(b.top===370){
        $(".innerdiv").animate({top: '9px'});            
        }
    });
});