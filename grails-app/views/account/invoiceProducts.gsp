<meta name="layout" content="main"/>
<h3 class="pageTitle">Products of invoice document</h3>
<p class="opermessage">${params?.message}</p>
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
            <td>${product?.numberOfProduct?.toString()?.replace(".0", "")}</td>
            <td>${product?.price?.toString()?.replace(".0", "")}</td>
            <td>${(product?.numberOfProduct*product?.price)?.toString()?.replace(".0", "")}</td>
            <td>${(product?.numberOfProduct*product?.price - product?.numberOfProduct*product?.price*product?.discount/100)?.toString()?.replace(".0", "")}</td>
            <td>${product?.discount?.toString()?.replace(".0", "")}</td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="col-md-6" style="background: #f5f5f57d;padding: 10px">
    <table>
        <tr>
            <td>Sum: </td>
            <td>${pricesum}</td>
        </tr>
        <tr>
            <td>Discount: </td>
            <td>${discount}</td>
        </tr>
        <tr>
            <td>Purchase: </td>
            <td><g:if test="${products?.price?.sum()}">${pricesum-discount}</g:if><g:else>0</g:else></td>
        </tr>
    </table>
</div>
<g:if test="${salesForm.user.id == user.id}">
    <g:if test="${salesForm?.status == 6}">
            <g:form action="submitInvoice6" id="${params?.id}">
                <button class="btn btn-success">Göndər</button>
            </g:form>
    </g:if>
    <g:elseif test="${salesForm?.status == 7}">
       Waiting response from ${salesForm?.purshaseForm?.user?.name}
    </g:elseif>
    <g:elseif test="${salesForm?.status == 8}">
            Invoice finished
    </g:elseif>
</g:if>
<g:elseif test="${salesForm?.purshaseForm?.user?.id == user?.id}">
    <g:if test="${salesForm?.status == 6}">
        Waiting response from ${salesForm?.user?.name}
    </g:if>
    <g:elseif test="${salesForm?.status == 7}">
        <g:form action="submitInvoice7" id="${params?.id}">
            <button class="btn btn-success">Təsdiq et</button>
        </g:form>
    </g:elseif>
    <g:elseif test="${salesForm?.status == 8}">
        Invoice finished
    </g:elseif>
</g:elseif>
%{--<g:if test="${salesForm.status == 1}">--}%
%{--<g:link action="addProductToSalesQuotation" id="${params?.id}">--}%
%{--<button class="btn btn-success pull-right"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>--}%
%{--</button>--}%
%{--</g:link>--}%
%{--</g:if>--}%
<g:render template="comments"/>