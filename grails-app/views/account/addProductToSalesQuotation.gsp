<meta name="layout" content="main"/>
<h3 class="pageTitle">Add product to sales quotation:</h3>
<div style="margin: auto">
    <h3>${sq?.name}</h3>
</div>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Description</th>
    <th>Count</th>
    <th>Price (USD)</th>
    <th>Discount (%)</th>
    <th>Add to order</th>
    </thead>
    <tbody>
    <g:each in="${pProducts}" var="product">
        <g:if test="${!ada.SalesFormProduct?.findBySalesFormAndStatusAndPurhshaseFormProduct(sq, 1, product)}">
            <g:form action="saveProductToSalesQuotation">
                <input type="hidden" name="pqid" value="${product?.id}"/>
                <tr>
                    <td>${product.product.name}</td>
                    <td>${product.description}</td>
                    <td><input required type="number" name="count" class="form-control"/></td>
                    <td><input required type="number" name="price" class="form-control"/></td>
                    <td><input required type="number" name="discount" class="form-control"/></td>
                    <td>
                        <button class="btn btn-success" type="submit">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        </button>
                    </td>
                </tr>
            </g:form>
        </g:if>
    </g:each>
    </tbody>
</table>