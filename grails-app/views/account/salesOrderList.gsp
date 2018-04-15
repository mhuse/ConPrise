<meta name="layout" content="main"/>
<h3 class="pageTitle">Sales orders</h3>
<table class="table table-bordered">
    <thead>
    <th>Title</th>
    <th>Description</th>
    <th>Products</th>
    %{--<th>Reject</th>--}%
    </thead>
    <tbody>
    <g:each in="${salesOrders}" var="salesOrder">
        <tr>
            <td>${salesOrder.name}</td>
            <td>${salesOrder.description}</td>
            <td>
                <g:link action="watchSalesOrder" id="${salesOrder?.id}"><span
                        class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></g:link>
            </td>
            %{--<td>--}%
            %{----}%
            %{--<span style="color:red" class="glyphicon glyphicon-remove" aria-hidden="true"></span>--}%
            %{--<g:if test="${quotation?.status == 1}">--}%
            %{--<g:link action="deletePurshaseQuotation" id="${quotation?.id}" style="color: red;"><span--}%
            %{--class="glyphicon glyphicon-remove" aria-hidden="true"></span></g:link>--}%
            %{--</g:if>--}%
            %{--</td>--}%
        </tr>
    </g:each>
    </tbody>
</table>