<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Description</th>
    <th>Count</th>
    <th>Price (USD)</th>
    <th>Discount (%)</th>
    <g:if test="${salesForm.status == 1}">
        <th>Save</th>
        <th>Delete</th>
    </g:if>
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
        <g:form action="saveProductToSalesQuotation" id="${product?.id}">
            <tr>
                <td>${product?.purhshaseFormProduct?.product?.name}</td>
                <td>${product?.purhshaseFormProduct?.description}</td>
                <td><input  <g:if test="${salesForm.status >= 2}">disabled</g:if> required type="number" name="count"
                            value="${product?.numberOfProduct?.toString()?.replace(".0", "")}" class="form-control"/>
                </td>
                <td><input <g:if test="${salesForm.status >= 2}">disabled</g:if> required type="number" name="price"
                           value="${product?.price?.toString()?.replace(".0", "")}" class="form-control"/></td>
                <td><input <g:if test="${salesForm.status >= 2}">disabled</g:if> type="number" name="discount"
                           value="${product?.discount?.toString()?.replace(".0", "")}" class="form-control"/></td>
                <g:if test="${salesForm.status == 1}"><td>
                    <button class="btn btn-success" type="submit">
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </button>
                </td>
                    <td>
                        <g:link action="deleteSalesQuotProduct" id="${product?.id}">
                            <button class="btn btn-danger" type="button">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </g:link>
                    </td>
                </g:if>
            </tr>
        </g:form>
    </g:each>
    </tbody>
</table>
<g:if test="${salesForm.status == 1}">
    <g:link action="addProductToSalesQuotation" id="${params?.id}">
        <button class="btn btn-success pull-right"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        </button>
    </g:link>
</g:if>
<g:render template="comments"/>