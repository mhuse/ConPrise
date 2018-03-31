<nav class="cd-side-nav">
    <ul>
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
        %{--<li class="has-children overview">--}%
            %{--<a href="${createLink(action: 'addPurshaseQuotation')}">Purshase quotation</a>--}%
            %{--<a href="${createLink(action: 'addSalesQuotation')}">Sales quotation</a>--}%
        %{--</li>--}%
        <li>
            <a href="${createLink(action: 'friendRequests')}">Friend request<span class="count">${friendRequest}</span></a>
        </li>
        <li>
            <a href="${createLink(action: 'notifications')}">Notifications<span class="count">${notificationCount}</span></a>
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
    </ul>
    <ul>
        <li class="action-btn"><a href="${createLink(action: 'addProduct')}">+ Add product</a></li>
    </ul>
</nav>