<meta name="layout" content="main"/>
<h3 class="pageTitle">Create sales quotation</h3>
<div class="col-md-6 col-md-offset-3">
    <g:form action="saveSalesQuatation" id="${params?.id}">
        <div class="form-group">
            <label>Title: </label>
            <input type="text" value="${quotation?.name}" name="name" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Description: </label>
            <textarea name="description" class="form-control">${quotation?.description}</textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success pull-right">Save</button>
        </div>
    </g:form>
</div>
