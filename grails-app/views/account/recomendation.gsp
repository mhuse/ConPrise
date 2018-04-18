<meta name="layout" content="main"/>
<g:if test="${companies}">
    <h1 style="color:#3e454c;font-family: ''">Suggested companies</h1>
    <div class="col-md-8" style="background: #f5f5f57d;padding:10px">
    <g:each in="${companies}" var="company">
        <g:if test="${company.id!=currentUser.id}"><br/>
            <g:if test="${company.companyInterest.interest.id[0] in conprise.Interest.findAll().id}">
                <g:if test="${!conprise.Friend?.findByUser1AndUser2AndStatusLessThan(company,currentUser,2) && !conprise.Friend?.findByUser1AndUser2AndStatusLessThan(currentUser,company,2)}">
                    <article class="search-result row">
                    <div class="col-xs-12 col-sm-12 col-md-3">
                        <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir: 'account/img',file: 'company.png')}" alt="${company.name}" /></a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-7">
                        <h3><a href="${createLink(action: 'profile',id:company?.id)}" title="">${company?.name}</a></h3>
                        <p>${company?.description?.take(500)}</p>

                            <span class="plus" st><a href="${createLink(action: 'addFriend',id:company?.id)}" title="" style="color:#fff">
                                <i class="glyphicon"></i> <b style="font-size:20px;font-family: monospace">+</b> Add as a friend</a></span>

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
        </g:if>
    </g:each>
    </div>
</g:if>