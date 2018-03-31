<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Description</th>
    <th>Count</th>
    <g:if test="${products?.pursaseForm?.status[0] == 1}">
        <th>Edit</th>
        <th>Delete</th>
    </g:if>
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
        <tr>
            <td>${product.product.name}</td>
            <td>${product.description}</td>
            <td>${product.numberOfProduct.toString().replace(".0", "")}</td>
            <g:if test="${products?.pursaseForm?.status[0] == 1}">
                <td><g:link action="addPurshaseRequestProduct" id="${product?.id}"
                            params="[quotationId: product?.pursaseForm?.id]" style="color: green"><span
                            class="glyphicon glyphicon-edit" aria-hidden="true"></span></g:link></td>
                <td><g:link action="removePurshaseFormProduct" id="${product?.id}" style="color: red;"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span></g:link></td>
            </g:if>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pull-right">
    <g:link action="purshaceQuatationList">
        <button class="btn btn-primary">Go to Purchase Quotations</button>
    </g:link>
    <g:if test="${products?.pursaseForm?.status[0] == 1}">
        <g:link action="submitQuotation" id="${params?.id}"
                >
            <button class="btn btn-success">Submit quoation and send notification to companies</button>
        </g:link>
    </g:if>
</div>