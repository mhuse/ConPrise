<meta name="layout" content="main"/>
<h3 class="pageTitle">Friend requests</h3>
<p class="opermessage">${params?.message}</p>
<g:each in="${friendRequests}" var="request">
<div class="form-group">
    <label>${request.user1.name} :</label>
    %{--<div class="clearfix"></div>--}%
    <g:link action="deleteFriendRequest" id="${request.user1.id}"><button class="btn btn-danger left">Delete</button></g:link>
    <g:link action="acceptFriendRequest" id="${request.user1.id}"><button class="btn btn-success left">Accept</button></g:link>
</div>
</g:each>