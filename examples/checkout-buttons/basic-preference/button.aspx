<%@ Page Language="c#" %>
<%@ Import Namespace="mercadopago" %>
<%@ Import Namespace="System.Collections" %>

    <%
        MP mp = new MP ("CLIENT_ID", "CLIENT_SECRET");

        Hashtable preference = mp.createPreference("{\"items\":[{\"title\":\"sdk-dotnet\",\"quantity\":1,\"currency_id\":\"ARS\",\"unit_price\":10.5}]}");
    %>
    
<!doctype html>
<html>
    <head>
       <title>MercadoPago SDK - Create Preference and Show Checkout Example</title>
    </head>
    <body>
        <a href="<% Response.Write(((Hashtable) preference["response"])["init_point"]); %>" name="MP-Checkout" class="orange-ar-m-sq-arall">Pay</a>
        <script type="text/javascript" src="http://mp-tools.mlstatic.com/buttons/render.js"></script>
    </body>
</html><?php
require_once ('mercadopago.php');

$mp = new MP('TU_CLIENT_ID', 'TU_CLIENT_SECRET');

$preference_data = array(
    "items" => array(
       array(
           "title" => "Pipa multicolorida",
           "quantity" => 1,
           "currency_id" => "ARS",
           "unit_price" => 10.00
       )
    )
);

$preference = $mp->create_preference ($preference_data);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Pagar</title>
    </head>
    <body>
        <a href="link_de_pagamento">Pagar</a>
    </body>
</html>
