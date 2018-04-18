<meta name="layout" content="main"/>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<h1 style="color:#3e454c;font-family: ''">List of companies</h1>
<p class="opermessage">${params?.message}</p>
<div class="col-md-8" style="background: #f5f5f57d;padding: 10px">

    <g:each in="${foundcompanies}" var="company">
        <article class="search-result row">
            <div class="col-xs-12 col-sm-12 col-md-3">
                <a href="#" title="Lorem ipsum" class="thumbnail">
                    <g:if test="${company?.image}">
                        <img src="${createLink(controller: "imageDisplayer", action: "companyImage", params: [photoName: user?.image, dir: ''])}"
                             alt="${company.name}"/>
                    </g:if>
                    <g:else>
                        <img src="${resource(dir: 'account/img', file: 'company.png')}" alt="${company.name}"/>
                    </g:else>

                </a>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-7" style="    padding-bottom: 100px;">
                <h3><a href="${createLink(action: 'profile', id: company?.id)}" title="">${company?.name}</a></h3>

                <p>${company?.description?.take(500)}</p>
                <g:set var="friend1" value="${conprise.Friend?.findByUser1AndUser2(company, currentUser)}"></g:set>
                <g:set var="friend2" value="${conprise.Friend?.findByUser1AndUser2(currentUser, company)}"></g:set>
                <g:if test="${(!friend1 && !friend2) || friend1?.status == 2 || friend2?.status == 2}">
                    <span class="plus">
                        <a href="${createLink(action: 'addFriend', id: company?.id)}" title="" style="color:#fff">
                            <i class="glyphicon"></i> <b
                                style="font-size:20px;font-family: monospace">+</b> Add as a friend
                        </a>
                    </span>
                </g:if>
                <g:else>
                    <span class="plus"><a style="background: red;color:#fff"
                                          href="${createLink(action: 'deleteFriend', id: company?.id)}" title="">
                        <i class="glyphicon"></i> Delete
                    </a></span>
                </g:else>
            %{--<g:else>--}%
            %{--<span class="plus" style="color: #2a6c15">Friend request sent</span>--}%
            %{--</g:else>--}%
            </div>

            <div class="col-xs-12 col-sm-12 col-md-3">
                <ul class="meta-search">
                    <g:if test="${company.creationDate}">
                        <li><i class="glyphicon glyphicon-calendar"></i> <span>${company?.creationDate?.toString()?.take(10)}</span>
                        </li>
                    </g:if>
                    <li><i class="glyphicon glyphicon-envelope"></i> <span>${company?.username}</span></li>
                </ul>
            </div>
            <span class="clearfix borda"></span>
        </article>
    </g:each>
</div>
</section>
