<meta name="layout" content="main"/>
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