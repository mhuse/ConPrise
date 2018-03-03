<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Title</th>
    <th>Edit</th>
    <th>Delete</th>
    </thead>
    <tbody>
    <g:each in="${quotations}" var="quotation">
        <tr>
            <td>${quotation.name}</td>
            <td><g:link action="addSalesQuotation" id="${quotation?.id}" style="color: green"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> </g:link> </td>
            <td><g:link action="deleteSalesQuotation" id="${quotation?.id}" style="color: red;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </g:link> </td>
        </tr>
    </g:each>
    </tbody>
</table>