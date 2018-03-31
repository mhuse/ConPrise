<meta name="layout" content="main"/>

<div class="col-md-6 col-md-offset-3">
    <g:uploadForm action="saveProduct" id="${params?.id}">
        <div class="form-group">
            <label>Category:</label>
            <g:select from="${categories}" value="${product?.category?.id}" optionKey="id" optionValue="name"
                      name="category" class="form-control"/>
        </div>

        <div class="form-group">
            <label>Product name:</label>
            <input type="text" value="${product?.name}" name="name" class="form-control"/>
        </div>
        <g:if test="${!product}">
            <div class="form-group">
                <label>Image:</label>
                <input type="file" name="file" class="form-control"/>
            </div>
        </g:if>
        <div class="form-group">
            <button type="submit" class="btn btn-success pull-right">Submit</button>
        </div>
    </g:uploadForm>
</div>
