# MercadoPago SDK module for Payments integration

* [Usage](#usage)
* [Using MercadoPago Checkout](#checkout)
* [Using MercadoPago Payment collection](#payments)

<a name="usage"></a>
## Usage:

1. Copy bin/mercadopago.dll to your project desired folder.

* Get your **CLIENT_ID** and **CLIENT_SECRET** in the following address:
    * Argentina: [https://www.mercadopago.com/mla/herramientas/aplicaciones](https://www.mercadopago.com/mla/herramientas/aplicaciones)
    * Brazil: [https://www.mercadopago.com/mlb/ferramentas/aplicacoes](https://www.mercadopago.com/mlb/ferramentas/aplicacoes)
    * México: [https://www.mercadopago.com/mlm/herramientas/aplicaciones](https://www.mercadopago.com/mlm/herramientas/aplicaciones)
    * Venezuela: [https://www.mercadopago.com/mlv/herramientas/aplicaciones](https://www.mercadopago.com/mlv/herramientas/aplicaciones)
    * Colombia: [https://www.mercadopago.com/mco/herramientas/aplicaciones](https://www.mercadopago.com/mco/herramientas/aplicaciones)

```C#
using mercadopago;

MP mp = new MP ("CLIENT_ID", "CLIENT_SECRET");
```

### Get your Access Token:

```C#
String accessToken = mp.getAccessToken();

Response.Write(accessToken);
```

<a name="checkout"></a>
## Using MercadoPago Checkout

### Get an existent Checkout preference:

```C#
Hashtable preference = mp.getPreference("PREFERENCE_ID");

Response.Write(preference);
```

### Create a Checkout preference:

```C#
Hashtable preference = mp.createPreference("{\"items\":[{\"title\":\"sdk-dotnet\",\"quantity\":1,\"currency_id\":\"ARS\",\"unit_price\":10.5}]}");

Response.Write(preference);
```

<a href="http://developers.mercadopago.com/documentacion/recibir-pagos#glossary">Others items to use</a>

### Update an existent Checkout preference:

```C#
Hashtable preference = mp.updatePreference("PREFERENCE_ID", "{\"items\":[{\"title\":\"sdk-dotnet\",\"quantity\":1,\"currency_id\":\"USD\",\"unit_price\":2}]}");

Response.Write(preference);
```

<a name="payments"></a>
## Using MercadoPago Payment

### Searching:

```C#
// Sets the filters you want
Dictionary<String, String> filters = new Dictionary<String, String> ();
    filters.Add("site_id", "MLA"); // Argentina: MLA; Brasil: MLB; Mexico: MLM; Venezuela: MLV; Colombia: MCO
    filters.Add("external_reference", "Bill001");
      
// Search payment data according to filters
Hashtable searchResult = mp.searchPayment (filters);

foreach (Hashtable payment in searchResult.SelectToken ("response.results")) {
    Response.Write(payment["collection"]["id"]);
    Response.Write(payment["collection"]["status"]);
}
```

<a href="http://developers.mercadopago.com/documentacion/busqueda-de-pagos-recibidos">More search examples</a>

### Receiving IPN notification:

* Go to **Mercadopago IPN configuration**:
    * Argentina: [https://www.mercadopago.com/mla/herramientas/notificaciones](https://www.mercadopago.com/mla/herramientas/notificaciones)
    * Brasil: [https://www.mercadopago.com/mlb/ferramentas/notificacoes](https://www.mercadopago.com/mlb/ferramentas/notificacoes)
    * México: [https://www.mercadopago.com/mlm/herramientas/notificaciones](https://www.mercadopago.com/mlm/herramientas/notificaciones)
    * Venezuela: [https://www.mercadopago.com/mlv/herramientas/notificaciones](https://www.mercadopago.com/mlv/herramientas/notificaciones)
    * Colombia: [https://www.mercadopago.com/mco/herramientas/notificaciones](https://www.mercadopago.com/mco/herramientas/notificaciones)<br />    

```C#
Hashtable payment_info = mp.getPaymentInfo("ID");

Response.Write(payment_info["response"]);
```    

### Cancel (only for pending payments):

```C#
Hashtable result = mp.cancelPayment("ID");

// Show result
Response.Write(result);
```

### Refund (only for accredited payments):

```C#
Hashtable result = mp.refundPayment("ID");

// Show result
Response.Write(result);
```
<a href=http://developers.mercadopago.com/documentacion/devolucion-y-cancelacion> About Cancel & Refund </a>
