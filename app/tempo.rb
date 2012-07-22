       <%= form_tag search_path, :method => :get do %>
    <%= text_field_tag 'title', 'Title, Author or ISBN', :class => "inp" , :onfocus=>"focus_title();" :onblur=>"blur_title();"%>
    <%= hidden_field_tag 'isbn', '-1'
    <%= submit_tag "Search" , :class=>"sub-btn" %>
<% end %>

 <form action="/search" method="GET" >
            <input  name="title" type="text" id="title" value="Title, Author or ISBN" class="inp" style= " background:url(http://www.thisyathat.com/images/thisyathat-new-finale_41.jpg) no-repeat left top ; "  onfocus="focus_title();" onblur="blur_title();" >
             <input type="hidden" name="isbn" value="-1" />
            <input name="search" type="submit" value=" " class="sub-btn" >
          </form>

  <table width="94%" border="0" class="search_table"cellpadding="5" align="center">
  <tr>
    <td width="25%" align="center" style="border-right:#E3AC6C solid 1px;padding-top:10px;padding-bottom:10px;"><a  href="http://www.thisyathat.com/bookprice?title=Theodore+Boone%3A+The+Abduction&by=John Grisham&isbn=9781444714579" ><img id="coverimg" class="sugimg" src="./images/not_available.jpg" style="width:70px; height:100px; border:1px #E3AC6C solid;" onerror= "this.src="./images/not_available.jpg";"/></a></td>
    <td width="75%" align="left" valign="top" style="padding-left:30px;">
			<!-- 
     		<div style="position:relative;float:right;margin-bottom:20px;padding-top:7px;"><fb:like href="http://www.thisyathat.com/bookprice?title=Theodore+Boone%3A+The+Abduction&by=John Grisham&isbn=9781444714579" layout="button_count" show_faces="false" action="like" colorscheme="light"></fb:like></div>
           --> <div style="padding-top:38px;">
		  <span class="suggest"> <a  href="http://www.thisyathat.com/bookprice?title=Theodore+Boone%3A+The+Abduction&by=John Grisham&isbn=9781444714579" > <%= item.title%> </a> </span><br/>
          <span style="font-size:12px; color:#666;">by <%= item.authors %> </br> ISBN: <%=item.isbn></span>	 
          </div>
    </td>
  </tr>
</table>



<tr>      
                         <td  width="180" class="started"><a href= <%= item[:url]%> target="_blank"><img width="80%" src=/assets/<%=item.gsub(":","")%>.gif /></a>
                        <div style="clear:both;"></div>
                           
                         </td>
                        <td align="center" class="rupees"><span class="small-font"> </span><%=item[:price]</td>
                        <td sorttable_customkey="2.5" align="center">2-3 Business Days</td>
                        <td align="center"> 
                          <img src = "images/cash.png" alt="Cash on delivery available"/> 
                        </td>
                        <td align="center"><a href= <%= item[:url]%> target="_blank"><div class="purchase button"></div></a></td>

</tr>