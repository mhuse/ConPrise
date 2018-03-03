<nav class="cd-side-nav">
    <ul>
        <li class="has-children overview">
            <a href="#0">Purshase quotation</a>

            <ul>
                <li><a href="${createLink(action: 'addPurshaseQuotation')}">Create new</a></li>
                <li><a href="${createLink(action: 'purshaceQuatationList')}">List of purshase quotations</a></li>
            </ul>
        </li>
        <li class="has-children overview">
            <a href="#0">Sales quotation</a>

            <ul>
                <li><a href="{createLink(action: 'addSalesQuotation')}">Create new</a></li>
                <li><a href="${createLink(action: 'salesQuatationList')}">List of sales quotations</a></li>
            </ul>
        </li>
        %{--<li class="has-children overview">--}%
            %{--<a href="${createLink(action: 'addPurshaseQuotation')}">Purshase quotation</a>--}%
            %{--<a href="${createLink(action: 'addSalesQuotation')}">Sales quotation</a>--}%
        %{--</li>--}%
        <li class="has-children notifications active">
            <a href="${createLink(action: 'friendRequests')}">Friend request<span class="count">${friendRequest}</span></a>
        </li>
        <li class="has-children notifications active">
            <a href="#0">Notifications<span class="count">${notificationCount}</span></a>
        </li>
        <li class="has-children notifications active">
            <a href="${createLink(action: 'productList')}">Products<span class="count">${productCount}</span></a>
        </li>
    </ul>
    <ul>
        <li class="action-btn"><a href="${createLink(action: 'addProduct')}">+ Add product</a></li>
    </ul>
</nav>