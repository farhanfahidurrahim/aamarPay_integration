<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Barcode</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
  <style>
  p{
      margin:-2px;
  }
    svg{
          position: relative;
        left: 50%;
        transform: translateX(-50%) !important;
        top:-2px;
    }
  </style>
</head>
<body>
	<div>
        <div>
            <div style="margin-top:-10px">
                @if($productstock  != null)
                    <p style="text-align: center; font-weight:bold; font-size:20px;">{{ get_setting('site_name')->value }}</p>
                    <p style="text-align: center; font-weight:bold; font-size:18px;">Price: {{$productstock->price }}</p>
                    <p style="text-align: center; font-weight:bold; font-size:18px;" class="show">Size: {{$productstock->varient}}</p>
                    <p style="text-align: center; font-weight:bold; font-size:18px;" class="show">Code: {{$productstock->stock_code}}</p>
                    <input type="hidden" class="barcode_img" value="{{ $productstock->stock_code }}"/>
                    <svg id="barcode" jsbarcode-format="upc" jsbarcode-value="123456789012" jsbarcode-textmargin="0" jsbarcode-fontoptions="bold"></svg>
                @endif
                @if($product != null)
                    <p style="text-align: center; font-size:20px;font-weight:bold">{{ get_setting('site_name')->value }}</p>
                    <p style="text-align: center; font-size:18px; font-weight:bold">Price: {{$product->regular_price }}</p>
                    <p style="text-align: center; font-size:18px; font-weight:bold">Code: {{$product->product_code }}</p>
                    <input type="hidden" class="barcode_img" value="{{ $product->product_code }}"/>
                    <svg id="barcode" jsbarcode-format="upc" jsbarcode-value="123456789012" jsbarcode-textmargin="0" jsbarcode-fontoptions="bold"></svg>
                @endif
            </div>
        </div>
    </div>
</body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsbarcode/3.11.5/JsBarcode.all.min.js"></script>
<script>
    window.onload = function() {
        window.print();
    };
    
    document.addEventListener("DOMContentLoaded", function() {
        var productCode = document.getElementsByClassName('barcode_img')[0].value;
        JsBarcode("#barcode", productCode);
    });
</script>