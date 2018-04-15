<meta name="layout" content="main"/>
<h3 class="pageTitle">Tracking documents</h3>
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
                <g:link action="trackingProducts" id="${doc?.id}"><span
                        class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></g:link>
            </td>
            <td>
                <g:if test="${doc?.status == 4}">
                    <g:link action="submitdelivery" id="${doc?.id}">
                        <span style="color:green" class="glyphicon glyphicon-ok"
                              aria-hidden="true">Click here if you have received .</span>
                    </g:link>
                </g:if>
                <g:if test="${doc?.status == 5}">
                    Waiting for saling company
                </g:if>
                <g:if test="${doc?.status == 6}">
                    Invoice created
                </g:if>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>