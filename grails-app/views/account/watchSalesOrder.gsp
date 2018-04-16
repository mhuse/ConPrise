<meta name="layout" content="main"/>
<h3 class="pageTitle">Sales order</h3>
    <table class="table table-bordered">
        <thead>
        <th>Product name</th>
        <th>Description</th>
        <th>Count</th>
        <th>Price (USD)</th>
        <th>Total (USD)</th>
        <th>Total with discount (USD)</th>
        <th>Discount (%)</th>
        </thead>
        <tbody>
        <g:each in="${products}" var="product">

            <tr>
                <td>${product?.purhshaseFormProduct?.product?.name}</td>
                <td>${product?.purhshaseFormProduct?.description}</td>
                <td>${product?.numberOfProduct?.toString()?.replace(".0", "")} </td>
                <td>${product?.price?.toString()?.replace(".0", "")}</td>
                <td>${(product?.numberOfProduct*product?.price)?.toString()?.replace(".0", "")}</td>
                <td>${(product?.numberOfProduct*product?.price - product?.numberOfProduct*product?.price*product?.discount/100)?.toString()?.replace(".0", "")}</td>
                <td>${product?.discount?.toString()?.replace(".0", "")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

<g:form action="submitSalesOrder" id="${params?.id}">
    <g:if test="${salesForm.status == 3}">

        <div class="col-md-4 pull-right">
            <div class="form-group">
                <label>Approximately delivery date: </label>
                <input type="date" name="date" class="form-control"/>
            </div>
            <button class="btn btn-success pull-right" type="submit">Create tracking document</button>
        </div>

    </g:if>
    <g:else><p class="submitted">Submitted</p></g:else>

</g:form>
<g:render template="comments"/>