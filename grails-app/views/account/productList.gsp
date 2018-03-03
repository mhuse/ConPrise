<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Edit</th>
    <th>Delete</th>
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
    <tr>
        <td>${product.name}</td>
        <td><g:link action="addProduct" id="${product?.id}" style="color: green"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> </g:link> </td>
        <td><g:link action="removeProduct" id="${product?.id}" style="color: red;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </g:link> </td>
    </tr>
    </g:each>
    </tbody>
</table>