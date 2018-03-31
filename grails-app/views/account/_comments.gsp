<div class="col-md-12" style="margin-top: 100px">
    <g:each in="${comments}" var="comment">
        <div class="col-md-12">
            <g:if test="${comment?.user?.id == currentUser.id}">
                <div class="comment col-md-6 pull-right">
                    <h4>${comment.user.name}</h4>
                    ${comment?.text}
                    <p class="pull-right commentdate">${comment?.dateCreated?.toString().substring(0,16)}</p>
                </div>
            </g:if>
            <g:else>
                <div class="comment col-md-6">
                    <h4>${comment.user.name}</h4>
                    ${comment?.text}
                    <p class="pull-right commentdate">${comment?.dateCreated?.toString().substring(0,16)}</p>
                </div>
            </g:else>
        </div>
    </g:each>
    <g:form action="submitComment" id="${params?.id}">
        <div class="form-group">
            <label>Your comment:</label>
            <textarea class="form-control" style="width: 100%;height: 200px" name="comment"></textarea>
        </div>

        <div class="form-group">
            <button class="btn btn-success pull-right">Submit</button>
        </div>
    </g:form>
</div>