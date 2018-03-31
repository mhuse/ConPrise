<meta name="layout" content="main"/>

<g:if test="${params?.message}">
    <h1 style="color:green">${params?.message}</h1>
</g:if>
<g:if test="${companies}">
<h1 style="color:green">Suggested companies</h1>
    <g:each in="${companies}" var="company">
        <g:if test="${company.id!=currentUser.id}"><br/>
            <g:if test="${company.companyInterest.interest.id[0] in ada.Interest.findAll().id}">
        <article class="search-result row">
            <div class="col-xs-12 col-sm-12 col-md-3">
                <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir: 'account/img',file: 'company.png')}" alt="${company.name}" /></a>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-7">
                <h3><a href="${createLink(action: 'profile',id:company?.id)}" title="">${company?.name}</a></h3>
                <p>${company?.description?.take(500)}</p>
                <g:if test="${!ada.Friend?.findByUser1AndUser2AndStatusLessThan(company,currentUser,2) && !ada.Friend?.findByUser1AndUser2AndStatusLessThan(currentUser,company,2)}">
                    <span class="plus"><a href="${createLink(action: 'addFriend',id:company?.id)}" title="">
                        <i class="glyphicon"> <b style="font-size:20px;font-family: monospace">+</b> Add as friend</i></a></span>
                </g:if>
                <g:else>
                    <span class="plus"><a  style="background: red" href="${createLink(action: 'deleteFriend',id:company?.id)}" title="">
                        <i class="glyphicon">Delete as friend</i>
                    </a></span>
                </g:else>
            %{--<g:else>--}%
            %{--<span class="plus" style="color: #2a6c15">Friend request sent</span>--}%
            %{--</g:else>--}%
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3">
                <ul class="meta-search">
                    <g:if test="${company.creationDate}">
                        <li><i class="glyphicon glyphicon-calendar"></i> <span>${company?.creationDate?.toString()?.take(10)}</span></li>
                    </g:if>
                    <li><i class="glyphicon glyphicon-envelope"></i> <span>${company?.username}</span></li>
                </ul>
            </div>
            <span class="clearfix borda"></span>
        </article>
            </g:if>
        </g:if>
    </g:each>
</g:if><g:else>
    <h1 style="color:green">Welcome !</h1>
</g:else>