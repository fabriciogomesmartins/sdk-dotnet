<%@ Page Language="c#" %>
<%@ Import Namespace="mercadopago" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>

	<%
    	MP mp = new MP ("CLIENT_ID", "CLIENT_SECRET");
    	
    	JObject preapprovalPayment = mp.createPreapprovalPayment("{'payer_email':'my_customer@my_site.com','back_url':'http://www.my_site.com','reason':'Monthly subscription to premium package','external_reference':'OP-1234','auto_recurring':{'frequency':1,'frequency_type':'months','transaction_amount':60,'currency_id':'BRL','start_date':'2012-12-10T14:58:11.778-03:00','end_date':'2013-06-10T14:58:11.778-03:00'}}");
    %>
    
<!doctype html>
<html>
    <head>
        <title>MercadoPago SDK - Create Preapproval Payment and Show Subscription Example</title>
    </head>
    <body>
       	<a href="<% Response.Write(preapprovalPayment["response"]["init_point"]); %>" name="MP-Checkout" class="orange-ar-m-sq-arall">Pay</a>
		<script type="text/javascript" src="http://mp-tools.mlstatic.com/buttons/render.js"></script>
    </body>
</html>
