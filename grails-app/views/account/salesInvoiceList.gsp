<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Title</th>
    <th>Description</th>
    <th>Products</th>
    <th>Status</th>
    </thead>
    <tbody>
    <g:each in="${docs}" var="doc">
        <tr>
            <td>${doc.name}</td>
            <td>${doc.description}</td>
            <td>
                <g:link action="invoiceProducts" id="${doc?.id}"><span
                        class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></g:link>
            </td>
            <td>
                <g:if test="${doc?.status == 6}">
                    Invoice is waiting response from ${doc?.purshaseForm?.user?.name}
                </g:if>
                <g:if test="${doc?.status == 7}">
                    Invoice is waiting for your response
                </g:if>
                <g:if test="${doc?.status == 8}">
                    Invoice finished
                </g:if>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>