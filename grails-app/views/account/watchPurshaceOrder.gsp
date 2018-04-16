<meta name="layout" content="main"/>
<h3 class="pageTitle">Purchase order</h3>
<g:form action="submitPurshaceOrder" id="${params?.id}">
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Description</th>
    <th>Count</th>
    <th>Price (USD)</th>
    <th>Total (USD)</th>
    <th>Total with discount (USD)</th>
    <th>Discount (%)</th>
    <g:if test="${salesForm?.status==2}">
    <th>Select</th>
    </g:if>
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
                <g:if test="${salesForm?.status==2}">
                <td><input type="checkbox" style="width: 30px;height: 30px" name="productId" value="${product?.id}"/></td>
                </g:if>
            </tr>
    </g:each>
    </tbody>
</table>
<g:if test="${salesForm.status == 2}">
        <button class="btn btn-success pull-right" type="submit">Submit
        </button>
</g:if><g:else>
    <p class="submitted"><p class="submitted">Submitted</p></p>
</g:else>

</g:form>
<g:render template="comments"/>