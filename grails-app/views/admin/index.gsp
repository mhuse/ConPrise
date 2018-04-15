<meta name="layout" content="adminHeader"/>

<div class="col-md-8 col-md-offset-2">
    <table class="table table-bordered">
        <thead>
        <th>Company</th>
        <th>Vöen</th>
        <th>Status</th>
        <th>Submit</th>
        </thead>
        <g:each in="${companies}" var="company">
            <tr>
                <td>${company?.name}</td>
                <td>${company?.voen}</td>
                <td>
                    <g:if test="${company?.enabled}">
                      <p style="color: #0af50a;">Active</p>
                    </g:if>
                    <g:else>
                        <p style="color:red">Disabled</p>
                    </g:else>

                </td>
                <td>
                    <g:if test="${company?.voenSubmitted}">
                        <p class="submitted">  Vöen submitted</p>
                    </g:if>
                    <g:else>
                        <g:link action="submitVoen" id="${company?.id}">
                            <button class="btn btn-success">Submit</button>
                        </g:link>
                    </g:else>
                </td>
            </tr>
        </g:each>
    </table>
</div>