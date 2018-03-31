<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Title</th>
    <th>Products</th>
    <th>Submit</th>
    <th>Edit</th>
    <th>Delete</th>
    </thead>
    <tbody>
    <g:each in="${quotations}" var="quotation">
        <tr>
            <td>${quotation.name}</td>
            <td><g:link action="salesQuotationProducts" id="${quotation?.id}"><span class="glyphicon glyphicon-eye-open"
                                                                                    aria-hidden="true"></span></g:link>
            </td>
            <td>
                <g:if test="${quotation?.status == 1}">
                    <g:link action="submitSalesQuotation" id="${quotation?.id}" style="color: green"
                           ><span
                            class="glyphicon glyphicon-ok" aria-hidden="true"></span></g:link>
                </g:if>
                <g:if test="${quotation?.status == 2}">
                    Submitted
                </g:if>
                <g:if test="${quotation?.status == 3}">
                    Accepted
                </g:if>
            </td>
            <td>
                <g:if test="${quotation?.status == 1}">
                    <g:link action="addSalesQuotation" id="${quotation?.id}" style="color: green"><span
                            class="glyphicon glyphicon-edit" aria-hidden="true"></span></g:link>
                </g:if>
            </td>
            <td>
                <g:if test="${quotation?.status == 1}">
                    <g:link action="deleteSalesQuotation" id="${quotation?.id}" style="color: red;"><span
                            class="glyphicon glyphicon-remove" aria-hidden="true"></span></g:link>
                </g:if>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>