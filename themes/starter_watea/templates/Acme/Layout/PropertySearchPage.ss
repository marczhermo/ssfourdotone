<section id="widget-grid" class="container">
    <div class="row">
        <div class="col-sm-12">
            <h2>Property Rentals</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12">
            <div class="row">
                <% include FieldRegions %>
                <% include FieldAmenities %>
                <% include FieldPriceRanges %>
                <% include FieldDateAndNights %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target="#collapse_search" class="collapseWill active" role="button">
                                Search <span class="pull-left"><i class="fa fa-caret-right"></i></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse_search" class="panel-collapse collapse in">
                        <div class="panel-body smoothscroll maxheight300 card card-body">
                            $PropertySearchForm
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12">
            <div class="row">
                <% include PropertyList %>
            </div>
            <%--
            <div class="row">
                <div class="col-sm-12 text-center">
                    <a href="javascript:void(0);" class="btn btn-primary btn-lg">Load more <i class="fa fa-arrow-down"></i></a>
                </div>
            </div>
            --%>
        </div>
    </div>
</section>
