<meta name="layout" content="main"/>
<h3 class="pageTitle">Tracking products</h3>
<table class="table table-bordered">
    <thead>
    <th>Name</th>
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
        <tr>
            <td>${product?.name}</td>
        </tr>
    </g:each>
    </tbody>
</table>
<g:render template="comments"/>