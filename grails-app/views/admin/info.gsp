<meta name="layout" content="adminHeader"/>

<div class="col-md-8 col-md-offset-2">

    <g:form action="saveInfo">
        <div class="form-group">
            <label>Title:</label>
            <input class="form-control" name="title" value="${info?.title}"/>
        </div>

        <div class="form-group">
            <label>Text:</label>
            <textarea class="form-control" name="text">${info?.text}</textarea>
        </div>
        <div class="form-group">
            <button class="btn btn-success">Save</button>
        </div>
    </g:form>
</div>