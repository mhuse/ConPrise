<meta name="layout" content="main"/>
<table class="table">
    <thead>
    <tr>
        <th>Friend </th>
        <th> Delete friend</th>
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
        <g:link action="deleteFriend" id="${friend?.id}">
     <button class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </button>
        </g:link>
</td>
</g:each>
</tr>
</tbody>
</table>