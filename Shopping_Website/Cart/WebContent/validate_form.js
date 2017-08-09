function validateForm() {
	var uid = document.form.userid;  
	var passid = document.form.password;  
	var uname = document.form.name;  
	var uadd = document.form.address;    
	var uemail = document.form.email;  
	var umsex = document.form.male;  
	var ufsex = document.form.female; 
	var uphone = document.form.phone;
	if(name_validation(uname))  
	{  
	if(passid_validation(passid,7,12))  
	{  
	if(userid_validation(uid,5,12))  
	{  
	if(gender_validation(umsex,ufsex))
	{   
	if(address_validation(uadd))  
	{   
	if(email_validation(uemail))  
	{ 
	if(phone_validation(uphone)){
	}
	}  
	}   
	}  
	}  
	}  
	}  
	return false;  
	}  

function name_validation(uname){
	
  
	var letters = /^[A-Za-z]+$/;  
	if(uname.value.match(letters))  
	{  
	return true;  
	}  
	else  
	{  
	alert('Username must have alphabet characters only');  
	uname.focus();  
	return false;  
	}  
}
function gender_validation(umsex,ufsex){
	x=0;  
	  
	if(umsex.checked)   
	{  
	x++;  
	} 
	if(ufsex.checked)  
	{  
	x++;   
	}  
	if(x==0)  
	{  
	alert('Select Male/Female');  
	umsex.focus();  
	return false;  
	}  
	else  
	{  
	
	return true;
	}  
	  
}
function userid_validation(uid,mx,my)  
{  
var uid_len = uid.value.length;  
if (uid_len == 0 || uid_len >= my || uid_len < mx)  
{  
alert("User Id should not be empty / length be between "+mx+" to "+my);  
uid.focus();  
return false;  
}  
return true;  
}  

function passid_validation(passid,mx,my)  
{  
var passid_len = passid.value.length;  
if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
{  
alert("Password should not be empty / length be between "+mx+" to "+my);  
passid.focus();  
return false;  
}  
return true;  
}  

function address_validation(uadd)  
{   
var letters = /^[0-9a-zA-Z]+$/;  
if(uadd.value.match(letters))  
{  
return true;  
}  
else  
{  
alert('User address must have alphanumeric characters only');  
uadd.focus();  
return false;  
}  
} 

function email_validation(uemail)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(uemail.value.match(mailformat))  
{  
	alert('Form Successfully Submitted');  
	window.location.reload();  
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
uemail.focus();  
return false;  
}  
}  

function phone_validation(uphone){
	var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  
	  if((uphone.value.match(phoneno))) 
	        {  
	      return true;  
	        }  
	      else  
	        {  
	        alert("invalid phone number");  
	        return false;  
	        }  
	
}