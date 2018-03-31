<meta name="layout" content="main"/>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Image</th>
    <th>Category</th>
    <th>Edit</th>
    <th>Delete</th>
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
    <tr>
        <td>${product?.name}</td>
        <td>
            <a title="${product?.name}" class="example-image-link" data-lightbox="example-set" href="${createLink(controller: "imageDisplayer", action: "productimage", params: [photoName: product?.image, dir: ''])}">
                <img class="productimage" src="${createLink(controller: "imageDisplayer", action: "productimage", params: [photoName: product?.image, dir: 'middle'])}"/>
        </a>
        </td>
        <td>${product?.category?.name}</td>
        <td><g:link action="addProduct" id="${product?.id}" style="color: green"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> </g:link> </td>
        <td><g:link action="removeProduct" id="${product?.id}" style="color: red;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </g:link> </td>
    </tr>
    </g:each>
    </tbody>
</table>