<meta name="layout" content="main"/>
<h3 class="pageTitle">Notifications </h3>
<style>
.notificationline {
    float: left;
    text-decoration: none;
    color: #000000;
    width: 100%;
    font-family: initial;
    font-size: 14px;
}

    .notificationparent > .form-group{
        height: 50px;
    }
</style>
<div class="notificationparent" style="padding:15px;width:50%;background: #f5f5f57d;border-radius: 10px">
    <g:each in="${notifications}" var="noty" status="i">

        <div class="form-group">
            <g:if test="${noty?.type?.type.equals("purshasequotation")}">

                <h3 class="notificationline">${ada.PurshaseForm?.get(noty?.formId)?.user?.name} ${noty?.type?.text}</h3>
                <g:link action="watchPurshaseQuotation" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("purshaceorder")}">
                <h3 class="notificationline"
                    class="notificationline">${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.user?.name}</h3>
                <g:link action="watchPurshaceOrder" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("salesorder")}">
                <h3 class="notificationline">${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name}</h3>
                <g:link action="watchSalesOrder" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("tracking")}">
                <h3 class="notificationline">${noty?.type?.text} from ${ada.SalesForm?.get(noty?.formId)?.user?.name}</h3>
                <g:link action="boughtTrackingDocuments" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("delivery")}">
                <h3 class="notificationline">${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name} ${noty?.type?.text} .</h3>
                <g:link action="soldTrackingDocuments"   params="['notification':noty?.id]"><button class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("invoice")}">
                <h3 class="notificationline">${noty?.type?.text} from  ${ada.SalesForm?.get(noty?.formId)?.user?.name}.</h3>
                <g:link action="purshaceInvoiceList" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("invoicesubmitted")}">
                <h3 class="notificationline">${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name} .</h3>
                <g:link action="salesInvoiceList" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("invoicesubmitted")}">
                <h3 class="notificationline">${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name} .</h3>
                <g:link action="invoiceProducts" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("invoicesubmitted2")}">
                <h3 class="notificationline">${noty?.type?.text} by ${ada.SalesForm?.get(noty?.formId)?.purshaseForm?.user?.name} .</h3>
                <g:link action="invoiceProducts" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
            <g:if test="${noty?.type?.type.equals("friendrequestaccept")}">
                <h3 class="notificationline">${ada.User.get(noty?.formId).name} ${noty?.type?.text}</h3>
                <g:link action="profile" id="${noty?.formId}"   params="['notification':noty?.id]"><button
                        class="pull-left btn btn-primary">Open</button></g:link>
            </g:if>
        </div>
        <br/>
    </g:each>
</div>