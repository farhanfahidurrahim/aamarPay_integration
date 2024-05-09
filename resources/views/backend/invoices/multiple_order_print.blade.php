<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Product</title>
</head>
<style>
    ul {
        padding: 0;
    }

    li {
        list-style: none;
    }

    table {
        border-collapse: collapse;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    td,
    th {
        padding: 3px;
    }

    th {
        font-weight: 700;
        font-size: 18px;
    }

    td,
    td,
    td {
        border: 1px solid #ddd;
    }

    p {
        margin: 0;
    }

    .aditional__info p {
        border-top: 1px dashed #ddd;
        padding: 5px 0;
    }

    .aditional__info p span {
        color: #5E23A6;
    }
</style>

<body>
@foreach ($orders as $order)
    <div class="wrapper"
        style="width: 576px;margin: auto;background-color: white;border: 1px solid #ddd; padding: 10px;">
        <div class="wrapper__header" style="text-align: center;">
            <h1 style="margin: 0;font-weight: 600;">Beauty Products BD</h1>
            <p style="font-size: 20px;">Phone: {{ get_setting('phone')->value }}</p>
            <hr style="margin: 0; margin-top: 10px;">
            <a href="{{ route('home') }}"><p style="text-decoration: underline;font-weight: 700;font-size: 20px;">www.beautyproductsbd.com</p></a>
        </div>
        <div style="display: flex; justify-content: space-between;">
            <ul class="customer__info">
                <li>Bill To:  @if ($order->user->role == 4)Walk-in Customer  @else {{ $order->user->name ?? 'Walk-in Customer' }} @endif</li>
                @if ($order->user->role != 4)
                  <li>Phone: {{ $order->phone ?? '' }}</li>
                @endif
            </ul>
            <ul class="customer__info">
                <li>Invoice No: {{ $order->invoice_no }}</li>
                <li>Invoice Date: {{ date('d-m-Y', strtotime($order->created_at)) }}</li>
            </ul>
        </div>
        <div class="product__info">
            <table style="width: 100%;text-align: center;">
                <tr>
                    <th>Product Name</th>
                    <th>Qty.</th>
                    <th>Unit Price</th>
                    <th>Total</th>
                </tr>
                @foreach ($order->order_details as $key => $orderDetail)
                    @if ($orderDetail->product != null)
                        <tr>
                            <td>{{ $orderDetail->product->name_en ?? '' }}</td>
                            <td>{{ $orderDetail->qty }}</td>
                            <td >{{ $orderDetail->price }}</td>
                            <td>{{ $orderDetail->price * $orderDetail->qty }}</td>
                        </tr>
                    @endif
                @endforeach
                <tr>
                    <td colspan="3" style="text-align: end;">Sub Total</td>
                    <td>{{ $order->sub_total }}</td>
                </tr>
                @if ($order->discount > 0)
                    <tr>
                        <td colspan="3" style="text-align: end;">Discount (-)</td>
                        <td>{{ $order->discount }}</td>
                    </tr>
                @endif
                @if ($order->shipping_charge > 0)
                    <tr>
                        <td colspan="3" style="text-align: end;">Shipping Charge (+)</td>
                        <td>{{ $order->shipping_charge }}</td>
                    </tr>
                @endif
                @if ($order->others > 0)
                    <tr>
                        <td colspan="3" style="text-align: end;">Others (+)</td>
                        <td>10</td>
                    </tr>
                @endif
                    <tr>
                        <td colspan="3" style="text-align: end;"><strong>Grand Total</strong></td>
                        <td>{{ $order->grand_total }}</td>
                    </tr>
                @if ($order->paid_amount > 0)
                    <tr>
                        <td colspan="3" style="text-align: end;">Paid</td>
                        <td>{{ $order->paid_amount }}</td>
                    </tr>
                @endif
                @if ($order->due_amount > 0)
                    <tr>
                        <td colspan="3" style="text-align: end;">Due</td>
                        <td>{{ $order->due_amount }}</td>
                    </tr>
                @endif
            </table>
        </div>

        <div style="text-align: center;margin-top: 10px;" class="aditional__info">
            <p><span>*</span>Cosmetics, accessories, and toys are not exchangeable.</p>
            <p><span>*</span>Once the delivery is complete, we would not be held responsible for sending wrong/damaged
                products
                (Please check products while receiving)</p>
            <p><span>*</span>An item can only be exchanged once within 7 days after invoiced.</p>
            <p><span>*</span>Products sold under discount offer is not exchangeable.</p>
            <p><span>*</span>For exchange invoice is required.</p>
            <p><span>*</span>Change of mind is not applicable</p>
            <p>Developed By: <a href="https://classicit.com.bd"><strong>Classic IT</strong></a></p>
        </div>

    </div>
@endforeach
</body>
</html>
<script>
    window.onload = function() {
        window.print();
    };
</script>