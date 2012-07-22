// JavaScript Document
function blur_title()
{
	if(document.getElementById('title').value == "")
	{
		document.getElementById('title').value = "Title, Author or ISBN";
		document.getElementById('title').style.color = "#B0B0B0";
	}
}

function focus_title()
{
	if(document.getElementById('title').value == "Title, Author or ISBN")
	{
		document.getElementById('title').value = "";
		document.getElementById('title').style.color = "#EE3F1A";
	}
	
}


function mob_blur_title()
{
	if(document.getElementById('mobname').value == "")
	{
		document.getElementById('mobname').value = "Mobile Name";
		document.getElementById('mobname').style.color = "#DBDBDB";
	}
}

function mob_focus_title()
{
	if(document.getElementById('mobname').value == "Mobile Name")
	{
		document.getElementById('mobname').value = "";
		document.getElementById('mobname').style.color = "#fb6626";
	}
	
}


function validate_search_book()
{
	if(document.getElementById('title').value == "Title, Author or ISBN" || document.getElementById('title').value == "" )
	{
		return false;
	}
}

function validate_search_mobile()
{
	if(document.getElementById('mobname').value == "Mobile Name" || document.getElementById('mobname').value == "" )
	{
		return false;
	}
} 

function Slidebox(slideTo,line_move,hideDiv,showDiv){  
  var animSpeed=500; 
    var easeType='easeInOutExpo'; 	
	$('#line_box .line').stop();
	 $('#line_box .line').animate({top: line_move}, animSpeed,  function() {
     document.getElementById(hideDiv).style.display = 'none';
	 document.getElementById(showDiv).style.display = 'block';
  }) ;
 }
