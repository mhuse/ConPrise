<meta name="layout" content="main"/>

<h3 class="pageTitle">Friend list:</h3>
<table class="table">
    <thead>
    <tr>
        <th>Friend</th>
        <th>Delete friend</th>
    </tr>
    </thead><tbody>
<g:each in="${friends}" var="friend">
    <tr><td>
    <g:if test="${friend?.user1?.id != currentUser.id}">
        <h4>${friend?.user1.name}</h4>
    </g:if>
    <g:else>
        <h4>${friend?.user2.name}</h4>
    </g:else>
    </td>
    <td>
        <g:if test="${friend?.user1?.id != currentUser.id}">
            <g:link action="deleteFriend" id="${friend?.user1?.id}">
                <button class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </button>
            </g:link>
        </g:if>
        <g:else>
            <g:link action="deleteFriend" id="${friend?.user2?.id}">
                <button class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </button>
            </g:link>
        </g:else>

    </td>
</g:each>
</tr>
</tbody>
</table>