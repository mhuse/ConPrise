<sec:ifLoggedIn>
<nav class="cd-side-nav">
    <ul>
        <li>
            <div class="form-group">
                <a href="${createLink(action: 'profile')}" style="color: #efc31d">
                    <img src="${createLink(controller: "imageDisplayer", action: "companyImage", params: [photoName: user?.image, dir: ''])}"
                         style="width: 150px;border-radius: 50%"/>
                </a>
                <a href="${createLink(action: 'profile')}" style="    color: #fbfbfb;
                background: #3e454c;
                width: 150px;
                margin: auto;
                border-radius: 4px;
                border: 1px solid #3e454c;">${user.name}</a>
            </div>
        </li>

        <hr/>
        <li class="has-children overview">
            <a href="#0">Purchasing</a>

            <ul>
                <li class="has-children overview">
                    <a href="#0">Purchase request</a>
                    <ul>
                        <li>
                            <a href="${createLink(action: 'purshaceRequestList')}">Purchase requests</a>
                            <a href="${createLink(action: 'addPurshaseRequest')}">Add purchase request</a>
                        </li>
                    </ul>
                    %{--<a href="${createLink(action: 'addPurshaseRequest')}">Purchase request</a>--}%
                </li>
                <li><a href="${createLink(action: 'purshaceQuatationList')}">Purchase quotations</a></li>
                <li><a href="${createLink(action: 'purshaceOrderList')}">Purchase orders</a></li>
                <li><a href="${createLink(action: 'boughtTrackingDocuments')}">Tracking</a></li>
                <li><a href="${createLink(action: 'purshaceInvoiceList')}">A/P invoice</a></li>
            </ul>
        </li>
        <li class="has-children overview">
            <a href="#0">Sales</a>

            <ul>
                <li><a href="${createLink(action: 'salesQuatationList')}">Sales quotations</a></li>
                <li><a href="${createLink(action: 'salesOrderList')}">Sales orders</a></li>
                <li><a href="${createLink(action: 'soldTrackingDocuments')}">Tracking</a></li>
                <li><a href="${createLink(action: 'salesInvoiceList')}">A/R invoice</a></li>
            </ul>
            %{--<ul>--}%
            %{--<li><a href="${createLink(action: 'addSalesQuotation')}">Create new</a></li>--}%
            %{--<li><a href="${createLink(action: 'salesQuatationList')}">List of sales quotations</a></li>--}%
            %{--</ul>--}%
        </li>
        <hr/>
        <li>
            <a href="${createLink(action: 'friendRequests')}">Friend request<span class="count">${friendRequest}</span>
            </a>
        </li>
        <li class="has-children overview">
            <a href="${createLink(action: 'notifications')}">Notifications<span
                    class="count">${notificationCount}</span></a>
            <ul style="height: 400px;overflow: auto">
                <g:each in="${notifications}" var="noty" status="i">
                    <li>

                        <g:if test="${noty?.type?.type.equals("purshasequotation")}">
                            <g:link action="watchPurshaseQuotation" id="${noty?.formId}" params="['notification':noty?.id]">
                                ${ada.PurshaseForm?.get(noty?.formId)?.user?.name} ${noty?.type?.text}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("purshaceorder")}">
                            <g:link action="watchPurshaceOrder" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.user?.name}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("salesorder")}">
                            <g:link action="watchSalesOrder" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name}
                            </g:link>
                        </g:if>

                        <g:if test="${noty?.type?.type.equals("tracking")}">
                            <g:link action="boughtTrackingDocuments" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.user?.name}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("delivery")}">
                            <g:link action="soldTrackingDocuments" params="['notification':noty?.id]">
                                ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name} ${noty?.type?.text}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("invoice")}">
                            <g:link action="purshaceInvoiceList" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} from  ${ada.SalesForm?.get(noty?.formId)?.user?.name}.
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("invoicesubmitted")}">
                            <g:link action="salesInvoiceList" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("invoicesubmitted")}">
                            <g:link action="invoiceProducts" id="${noty?.formId}"  params="['notification':noty?.id]">
                                ${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("invoicesubmitted2")}">
                            <g:link action="invoiceProducts" id="${noty?.formId}" params="['notification':noty?.id]">
                                ${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name}
                            </g:link>
                        </g:if>
                        <g:if test="${noty?.type?.type.equals("friendrequestaccept")}">
                            <g:link action="profile" id="${noty?.formId}" params="['notification':noty?.id]">
                                ${ada.User.get(noty?.formId).name} ${noty?.type?.text}
                            </g:link>
                        </g:if>

                    </li>
                </g:each>
                <li><g:link action="notifications" style="text-align: center">View all</g:link></li>
            </ul>
        </li>
        <li>
            <a href="${createLink(action: 'productList')}">Products<span class="count">${productCount}</span></a>
        </li>

        <li>
            <a href="${createLink(action: 'companies')}">List of companies<span class="count">${companycount}</span></a>
        </li>
        <li>
            <a href="${createLink(action: 'friendList')}">List of friends<span class="count">${friendscount}</span></a>
        </li>
        <hr/>


        %{--<li class="has-children overview">--}%
        %{--<a href="${createLink(action: 'addPurshaseQuotation')}">Purshase quotation</a>--}%
        %{--<a href="${createLink(action: 'addSalesQuotation')}">Sales quotation</a>--}%
        %{--</li>--}%


        <li>
            <a href="${createLink(action: 'recomendation')}">Suggested companies</a>
        </li>
    </ul>
    <ul style="height: 100px"></ul>
    <ul>
        <li class="action-btn"><a href="${createLink(action: 'addProduct')}">+ Add product</a></li>
    </ul>
</nav>
<style>
    hr{
        width:90%
    }
</style>
</sec:ifLoggedIn>